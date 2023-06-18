function calculate (){

  const Itemprice = document.getElementById("item-price")
  const AddTaxPrice = document.getElementById("add-tax-price")
  const Profit = document.getElementById("profit")

  Itemprice.addEventListener("input", () => {
    const pricevalue = Itemprice.value
    const taxprice = Math.floor(pricevalue * 0.1);
    AddTaxPrice.innerHTML = taxprice.toLocaleString();
    Profit.innerHTML = (pricevalue - taxprice).toLocaleString();
  });
};
window.addEventListener('load', calculate);
