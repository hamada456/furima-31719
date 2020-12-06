const pay = () => {
  Payjp.setPublicKey("pk_test_2dc21c1232f51bad9e32e117");
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();
    
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("furimaform[number]"),
      cvc: formData.get("furimaform[cvc]"),
      exp_month: formData.get("furimaform[exp_month]"),
      exp_year: `20${formData.get("furimaform[exp_year]")}`,
    };
    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        console.log(token)
      }
    });
  });
};

window.addEventListener("load", pay);