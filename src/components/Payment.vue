<template>
    <div class="container mt-5">
        <div class="card">
            <div class="card-header">
                <h2>Payment</h2>
            </div>
            <div class="card-body">
                <div class="mb-3">
                    <label for="paymentMethod">Payment Method</label>
                    <select v-model="model.payment.method" @change="resetFields" class="form-control">
                        <option value="">Select Payment Method</option>
                        <option value="transferBank">Transfer Bank</option>
                        <option value="eWallet">E-Wallet</option>
                        <option value="phoneNumber">Nomor Telepon</option>
                        <option value="creditDebitCard">Kartu Kredit/Debit</option>
                    </select>
                </div>

                <div v-if="model.payment.method === 'transferBank'">
                    <div class="mb-3">
                        <label for="bank">Transfer Bank</label>
                        <select v-model="model.payment.bank" @change="resetAccountNumber" class="form-control">
                            <option value="">Select Bank</option>
                            <option value="BRI">BRI (15/16-digit)</option>
                            <option value="BCA">BCA (10-digit)</option>
                            <option value="BNI">BNI (10-digit)</option>
                            <option value="Mandiri">Mandiri (13-digit)</option>
                        </select>
                    </div>
                    <div class="mb-3" v-if="model.payment.bank">
                        <label for="accountNumber">Nomor Rekening</label>
                        <input
                            type="text"
                            v-model="model.payment.accountNumber"
                            class="form-control"
                            :maxlength="accountNumberMaxLength"
                        />
                        <small v-if="!isAccountNumberValid" class="text-danger">
                            {{ accountNumberErrorMessage }}
                        </small>
                    </div>
                </div>

                <div v-if="model.payment.method === 'eWallet'">
                    <div class="mb-3">
                        <label for="ewallet">E-Wallet</label>
                        <select v-model="model.payment.ewallet" class="form-control">
                            <option value="">Select E-Wallet</option>
                            <option value="Ovo">Ovo (11-13 digit)</option>
                            <option value="Dana">Dana (11-13 digit)</option>
                            <option value="Gopay">Gopay (11-13 digit)</option>
                            <option value="Shopee">Shopee (11-13 digit)</option>
                        </select>
                    </div>
                    <div class="mb-3" v-if="model.payment.ewallet">
                        <label :for="`ewalletPhoneNumber${model.payment.ewallet}`">Nomor {{ model.payment.ewallet }}</label>
                        <input
                            type="text"
                            v-model="model.payment.ewalletPhoneNumber"
                            class="form-control"
                            :maxlength="ewalletPhoneNumberMaxLength"
                        />
                        <small v-if="!isEwalletPhoneNumberValid" class="text-danger">
                            Nomor HP Harus 11-13 Digit.
                        </small>
                    </div>
                </div>

                <div v-if="model.payment.method === 'phoneNumber'">
                    <div class="mb-3">
                        <label for="phoneNumberType">Nomor Telepon</label>
                        <select v-model="model.payment.phoneNumberType" class="form-control">
                            <option value="">Select Nomor Telepon</option>
                            <option value="Tri">Tri (12-13 digit)</option>
                            <option value="Smartfren">Smartfren (11-12 digit)</option>
                            <option value="Simpati">Simpati (12 digit)</option>
                            <option value="XL">XL (12 digit)</option>
                        </select>
                    </div>
                    <div class="mb-3" v-if="model.payment.phoneNumberType">
                        <label for="phonenumber">Nomor Telepon</label>
                        <input
                            type="text"
                            v-model="model.payment.phonenumber"
                            class="form-control"
                            :maxlength="phoneNumberMaxLength"
                        />
                        <small v-if="!isPhoneNumberValid" class="text-danger">
                            Nomor Telepon Harus 11-13 Digit
                        </small>
                    </div>
                </div>

                <div v-if="model.payment.method === 'creditDebitCard'">
                    <div class="mb-3">
                        <label for="nomorkartu">Nomor Kartu</label>
                        <input type="text" v-model="model.payment.nomorkartu" class="form-control" :maxlength="12" />
                        <small v-if="!isNomorKartuValid" class="text-danger">Nomor Kartu Harus 12 Digit.</small>
                    </div>
                    <div class="mb-3">
                        <label for="tanggalkadaluarsa">Tanggal Kadaluarsa (BB/TT)</label>
                        <input type="text" v-model="model.payment.tanggalkadaluarsa" class="form-control" :maxlength="5" />
                        <small v-if="!isTanggalKadaluarsaValid" class="text-danger">Format Tanggal Kadaluarsa Harus BB/TT.</small>
                    </div>
                    <div class="mb-3">
                        <label for="namadikartu">Nama Dikartu</label>
                        <input type="text" v-model="model.payment.namadikartu" class="form-control" :maxlength="100" />
                        <small v-if="!isNamaDikartuValid" class="text-danger">Nama Dikartu Tidak Boleh Kosong dan Maksimal 100 Karakter.</small>
                    </div>
                    <div class="mb-3">
                        <label for="cvv">CVV</label>
                        <input type="text" v-model="model.payment.cvv" class="form-control" :maxlength="3" />
                        <small v-if="!isCVVValid" class="text-danger">CVV Harus 3 Digit.</small>
                    </div>
                </div>

                <div class="mb-3">
                    <button type="button" class="btn btn-primary" @click="savePayment" :disabled="!isFormValid">Submit</button>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import axios from 'axios';

export default {
    name: 'PaymentCreate',
    data() {
        return {
            model: {
                payment: {
                    method: '',
                    bank: '',
                    accountNumber: '',
                    ewallet: '',
                    ewalletPhoneNumber: '',
                    phoneNumberType: '',
                    phonenumber: '',
                    nomorkartu: '',
                    tanggalkadaluarsa: '',
                    namadikartu: '',
                    cvv: ''
                }
            }
        };
    },
    computed: {
        accountNumberMaxLength() {
            switch (this.model.payment.bank) {
                case 'BRI':
                    return 16;
                case 'BCA':
                    return 10;
                case 'BNI':
                    return 10;
                case 'Mandiri':
                    return 13;
                default:
                    return 0;
            }
        },
        ewalletPhoneNumberMaxLength() {
            return 13;
        },
        phoneNumberMaxLength() {
            switch (this.model.payment.phoneNumberType) {
                case 'Tri':
                    return 13;
                case 'Smartfren':
                    return 12;
                case 'Simpati':
                case 'XL':
                    return 12;
                default:
                    return 0;
            }
        },
        isAccountNumberValid() {
            const { bank, accountNumber } = this.model.payment;
            if (bank === 'BRI' && (accountNumber.length === 15 || accountNumber.length === 16)) return true;
            if (bank === 'BCA' && accountNumber.length === 10) return true;
            if (bank === 'BNI' && accountNumber.length === 10) return true;
            if (bank === 'Mandiri' && accountNumber.length === 13) return true;
            return false;
        },
        accountNumberErrorMessage() {
            switch (this.model.payment.bank) {
                case 'BRI':
                    return 'Nomor Rekening Harus 15-16 Digit';
                case 'BCA':
                    return 'Nomor Rekening Harus 10 Digit';
                case 'BNI':
                    return 'Nomor Rekening Harus 10 Digit';
                case 'Mandiri':
                    return 'Nomor Rekening Harus 13 Digit';
                default:
                    return '';
            }
        },
        isPhoneNumberValid() {
            const { phoneNumberType, phonenumber } = this.model.payment;
            switch (phoneNumberType) {
                case 'Tri':
                    return phonenumber.length === 12 || phonenumber.length === 13;
                case 'Smartfren':
                    return phonenumber.length === 11 || phonenumber.length === 12;
                case 'Simpati':
                case 'XL':
                    return phonenumber.length === 12;
                default:
                    return false;
            }
        },
        isEwalletPhoneNumberValid() {
            const { ewalletPhoneNumber } = this.model.payment;
            return /^[0-9]{11,13}$/.test(ewalletPhoneNumber);
        },
        isNomorKartuValid() {
            const { nomorkartu } = this.model.payment;
            return /^[0-9]{12}$/.test(nomorkartu);
        },
        isTanggalKadaluarsaValid() {
            const { tanggalkadaluarsa } = this.model.payment;
            return /^(0[1-9]|1[0-2])\/[0-9]{2}$/.test(tanggalkadaluarsa);
        },
        isNamaDikartuValid() {
            const { namadikartu } = this.model.payment;
            return namadikartu.length > 0 && namadikartu.length <= 100;
        },
        isCVVValid() {
            const { cvv } = this.model.payment;
            return /^[0-9]{3}$/.test(cvv);
        },
        isFormValid() {
            if (this.model.payment.method === 'transferBank') {
                return this.isAccountNumberValid;
            } else if (this.model.payment.method === 'eWallet') {
                return this.isEwalletPhoneNumberValid;
            } else if (this.model.payment.method === 'phoneNumber') {
                return this.isPhoneNumberValid;
            } else if (this.model.payment.method === 'creditDebitCard') {
                return this.isNomorKartuValid && this.isTanggalKadaluarsaValid && this.isNamaDikartuValid && this.isCVVValid;
            }
            return false;
        }
    },
    methods: {
        resetFields() {
            this.model.payment.bank = '';
            this.model.payment.accountNumber = '';
            this.model.payment.ewallet = '';
            this.model.payment.ewalletPhoneNumber = '';
            this.model.payment.phoneNumberType = '';
            this.model.payment.phonenumber = '';
            this.model.payment.nomorkartu = '';
            this.model.payment.tanggalkadaluarsa = '';
            this.model.payment.namadikartu = '';
            this.model.payment.cvv = '';
        },
        resetAccountNumber() {
            this.model.payment.accountNumber = '';
        },
        savePayment() {
            if (this.isFormValid) {
                axios.post('http://localhost:8000/payment', this.model.payment)
                .then(response => {
                    console.log(response.data);
                    alert('Payment saved successfully!');
                    this.resetFields();
                })
                .catch(error => {
                    console.error('Failed to save payment:', error);
                    alert('Failed to save payment. Check console for details.');
                });
            } else {
                console.log('Form is not valid');
                alert('Form is not valid. Please check the inputs.');
            }
        },
    }
};
</script>
