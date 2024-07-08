<template>
    <div class="container mt-5">
      <div class="card">
        <div class="card-header">
          <h4>Address Information</h4>
        </div>
        <div class="card-body">
          <div class="mb-3">
            <label for="Wilayah">Wilayah</label>
            <select v-model="model.address.method" @change="resetFields" class="form-control">
              <option value="Provinsi">Provinsi</option>
            </select>
          </div>
  
          <div v-if="model.address.method === 'Provinsi'" class="mb-3">
            <label for="provinsi">Provinsi</label>
            <select v-model="model.address.provinsi" class="form-control">
              <option value="">Pilih Provinsi</option>
              <option value="Aceh">Aceh</option>
              <option value="Sumatera Utara">Sumatera Utara</option>
              <option value="Sumatera Barat">Sumatera Barat</option>
              <option value="Riau">Riau</option>
              <option value="Jambi">Jambi</option>
              <option value="Sumatera Selatan">Sumatera Selatan</option>
              <option value="Bengkulu">Bengkulu</option>
              <option value="Lampung">Lampung</option>
              <option value="Kepulauan Bangka Belitung">Kepulauan Bangka Belitung</option>
              <option value="Kepulauan Riau">Kepulauan Riau</option>
              <option value="DKI Jakarta">DKI Jakarta</option>
              <option value="Jawa Barat">Jawa Barat</option>
              <option value="Jawa Tengah">Jawa Tengah</option>
              <option value="DI Yogyakarta">DI Yogyakarta</option>
              <option value="Jawa Timur">Jawa Timur</option>
              <option value="Banten">Banten</option>
              <option value="Bali">Bali</option>
              <option value="Nusa Tenggara Barat">Nusa Tenggara Barat</option>
              <option value="Nusa Tenggara Timur">Nusa Tenggara Timur</option>
              <option value="Kalimantan Barat">Kalimantan Barat</option>
              <option value="Kalimantan Tengah">Kalimantan Tengah</option>
              <option value="Kalimantan Selatan">Kalimantan Selatan</option>
              <option value="Kalimantan Timur">Kalimantan Timur</option>
              <option value="Kalimantan Utara">Kalimantan Utara</option>
              <option value="Sulawesi Utara">Sulawesi Utara</option>
              <option value="Sulawesi Tengah">Sulawesi Tengah</option>
              <option value="Sulawesi Selatan">Sulawesi Selatan</option>
              <option value="Sulawesi Tenggara">Sulawesi Tenggara</option>
              <option value="Gorontalo">Gorontalo</option>
              <option value="Sulawesi Barat">Sulawesi Barat</option>
              <option value="Maluku">Maluku</option>
              <option value="Maluku Utara">Maluku Utara</option>
              <option value="Papua">Papua</option>
              <option value="Papua Barat">Papua Barat</option>
              <option value="Papua Selatan">Papua Selatan</option>
              <option value="Papua Tengah">Papua Tengah</option>
              <option value="Papua Pegunungan">Papua Pegunungan</option>
            </select>
          </div>
  
          <div v-if="model.address.method === 'Kabupaten/kota'" class="mb-3">
            <label for="kabupatenkota">Kabupaten/Kota</label>
            <input type="text" v-model="model.address.kabupatenkota" class="form-control" />
          </div>
  
          <div v-if="model.address.method === 'Kelurahan/Kecamatan'" class="mb-3">
            <label for="kelurahankecamatan">Kelurahan/Kecamatan</label>
            <input type="text" v-model="model.address.kelurahankecamatan" class="form-control" />
          </div>
  
          <div v-if="model.address.method === 'KodePos'" class="mb-3">
            <label for="kodepos">Kode Pos</label>
            <input type="text" v-model="model.address.kodepos" class="form-control" />
          </div>
  
          <div v-if="model.address.method === 'AlamatLengkap'" class="mb-3">
            <label for="alamatlengkap">Alamat Lengkap</label>
            <input type="text" v-model="model.address.alamatlengkap" class="form-control" />
          </div>
  
          <div v-if="model.address.method === 'DetailPatokan'" class="mb-3">
            <label for="detailpatokan">Detail Patokan</label>
            <input type="text" v-model="model.address.detailpatokan" class="form-control" />
          </div>
  
          <div class="mb-3">
            <label for="namalengkap">Nama Lengkap</label>
            <input type="text" v-model="model.address.namalengkap" class="form-control" />
          </div>
          <div class="mb-3">
            <label for="nomortelepon">Nomor Telepon</label>
            <input type="text" v-model="model.address.nomortelepon" class="form-control" />
          </div>
          <div class="mb-3">
            <label for="kabupatenkota">Kabupaten/Kota</label>
            <input type="text" v-model="model.address.kabupatenkota" class="form-control" />
          </div>
          <div class="mb-3">
            <label for="kelurahankecamatan">Kelurahan/Kecamatan</label>
            <input type="text" v-model="model.address.kelurahankecamatan" class="form-control" />
          </div>
          <div class="mb-3">
            <label for="kodepos">Kode pos</label>
            <input type="text" v-model="model.address.kodepos" class="form-control" />
          </div>
          <div class="mb-3">
            <label for="alamatlengkap">Alamat Lengkap</label>
            <input type="text" v-model="model.address.alamatlengkap" class="form-control" />
          </div>
          <div class="mb-3">
            <label for="detailpatokan">Detail patokan</label>
            <input type="text" v-model="model.address.detailpatokan" class="form-control" />
          </div>
          <div class="mb-3">
            <button type="button" class="btn btn-primary" @click="saveAddress">Save</button>
          </div>
        </div>
      </div>
  
      <div class="card mt-5">
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
              </select>
            </div>
            <div class="mb-3">
              <label for="phoneNumber">Nomor Telepon</label>
              <input type="text" v-model="model.payment.phoneNumber" class="form-control" />
            </div>
          </div>
  
          <div v-if="model.payment.method === 'phoneNumber'">
            <div class="mb-3">
              <label for="phoneNumber">Nomor Telepon</label>
              <input type="text" v-model="model.payment.phoneNumber" class="form-control" />
            </div>
          </div>
  
          <div v-if="model.payment.method === 'creditDebitCard'">
            <div class="mb-3">
              <label for="cardNumber">Nomor Kartu Kredit/Debit</label>
              <input type="text" v-model="model.payment.cardNumber" class="form-control" maxlength="16" />
            </div>
            <div class="mb-3">
              <label for="expiryDate">Tanggal Kadaluarsa</label>
              <input type="text" v-model="model.payment.expiryDate" class="form-control" placeholder="MM/YY" />
            </div>
            <div class="mb-3">
              <label for="cvv">CVV</label>
              <input type="text" v-model="model.payment.cvv" class="form-control" maxlength="3" />
            </div>
          </div>
  
          <div class="mb-3">
            <button type="button" class="btn btn-primary" @click="savePayment">Save</button>
          </div>
        </div>
      </div>
    </div>
  </template>
  
  <script>
  import { ref } from "vue";
  
  export default {
    data() {
      return {
        model: {
          address: {
            method: "",
            provinsi: "",
            kabupatenkota: "",
            kelurahankecamatan: "",
            kodepos: "",
            alamatlengkap: "",
            detailpatokan: "",
            namalengkap: "",
            nomortelepon: ""
          },
          payment: {
            method: "",
            bank: "",
            accountNumber: "",
            ewallet: "",
            phoneNumber: "",
            cardNumber: "",
            expiryDate: "",
            cvv: ""
          }
        },
        accountNumberMaxLength: 0,
        accountNumberErrorMessage: "",
        isAccountNumberValid: true
      };
    },
    methods: {
      resetFields() {
        this.model.payment.bank = "";
        this.model.payment.accountNumber = "";
        this.model.payment.ewallet = "";
        this.model.payment.phoneNumber = "";
        this.model.payment.cardNumber = "";
        this.model.payment.expiryDate = "";
        this.model.payment.cvv = "";
        this.accountNumberMaxLength = 0;
        this.accountNumberErrorMessage = "";
        this.isAccountNumberValid = true;
      },
      resetAccountNumber() {
        this.model.payment.accountNumber = "";
        switch (this.model.payment.bank) {
          case "BRI":
            this.accountNumberMaxLength = 16;
            this.accountNumberErrorMessage = "Nomor rekening BRI harus 15 atau 16 digit";
            break;
          case "BCA":
            this.accountNumberMaxLength = 10;
            this.accountNumberErrorMessage = "Nomor rekening BCA harus 10 digit";
            break;
          case "BNI":
            this.accountNumberMaxLength = 10;
            this.accountNumberErrorMessage = "Nomor rekening BNI harus 10 digit";
            break;
          case "Mandiri":
            this.accountNumberMaxLength = 13;
            this.accountNumberErrorMessage = "Nomor rekening Mandiri harus 13 digit";
            break;
          default:
            this.accountNumberMaxLength = 0;
            this.accountNumberErrorMessage = "";
        }
        this.isAccountNumberValid = true;
      },
      saveAddress() {
        console.log("Address Information Saved:", this.model.address);
      },
      savePayment() {
        if (this.model.payment.method === "transferBank") {
          this.validateAccountNumber();
          if (!this.isAccountNumberValid) {
            return;
          }
        }
        console.log("Payment Information Saved:", this.model.payment);
      },
      validateAccountNumber() {
        const accountNumberLength = this.model.payment.accountNumber.length;
        switch (this.model.payment.bank) {
          case "BRI":
            this.isAccountNumberValid = accountNumberLength === 15 || accountNumberLength === 16;
            break;
          case "BCA":
            this.isAccountNumberValid = accountNumberLength === 10;
            break;
          case "BNI":
            this.isAccountNumberValid = accountNumberLength === 10;
            break;
          case "Mandiri":
            this.isAccountNumberValid = accountNumberLength === 13;
            break;
          default:
            this.isAccountNumberValid = false;
        }
      }
    }
  };
  </script>
  