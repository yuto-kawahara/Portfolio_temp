window.addEventListener('DOMContentLoaded', () => {
  new ProfileForm();

  // const name = document.querySelector("#name");
  // name.addEventListener('change', function());
  
});

class ProfileForm {
  constructor() {
    this.name = document.querySelector("#name");
    this.email = document.querySelector("#email");
    this.tel = document.querySelector("#tel");
    this.postal = document.querySelector("#postal");
    this.eventType = this._getEventType();
    this._addEvent();
  }

  _getEventType() {
    return window.onchange = 'change';
  }
  
  _nameValidate() {
    const errMsgName = document.querySelector('.err-msg-name');
    if(!this.name.value) {
      errMsgName.classList.add('form-invalid');
      errMsgName.textContent = "お名前が入力されていません"
      this.name.classList.add('input-invalid');
      return;
    }
    else {
      errMsgName.textContent = "";
      this.name.classList.remove('input-invalid');
    }
  }

  _emailValidate() {
    const errMsgEmail = document.querySelector('.err-msg-email');
    var reg = /^[A-Za-z0-9]{1}[A-Za-z0-9_.-]*@{1}[A-Za-z0-9_.-]{1,}\.[A-Za-z0-9]{1,}$/;

    if(!reg.test(this.email.value)) {
      errMsgEmail.classList.add('form-invalid');
      errMsgEmail.textContent = "メールアドレスを正しく入力してください"
      this.email.classList.add('input-invalid');
      return;
    }
    else {
      errMsgEmail.textContent = "";
      this.email.classList.remove('input-invalid');
    }
  }

  _telValidate() {
    const errMsgTel = document.querySelector('.err-msg-tel');
    var reg = /^(0[5-9]0[0-9]{8}|0[1-9][1-9][0-9]{7})$/;
    var tel = this.tel.value.replace(/[━.*‐.*―.*－.*\-.*ー.*\-]/gi,'');
    if(!reg.test(tel)) {
      errMsgTel.classList.add('form-invalid');
      errMsgTel.textContent = "電話番号を正しく入力してください"
      this.tel.classList.add('input-invalid');
      return;
    }
    else {
      errMsgTel.textContent = "";
      this.tel.classList.remove('input-invalid');
    }
  }

  _postalValidate() {

  }

  _addEvent() {
    this.name.addEventListener(this.eventType, this._nameValidate.bind(this));
    this.email.addEventListener(this.eventType, this._emailValidate.bind(this));
    this.tel.addEventListener(this.eventType, this._telValidate.bind(this));  
  }
}
