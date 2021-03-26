window.addEventListener('load', ()=>{
  // console.log(200 - "aaa")
  // console.log(200 + "aaa")
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    console.log(inputValue);


  const addTaxDom = document.getElementById("add-tax-price");
  const taxPrice = Math.floor(inputValue * 0.1);
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1);
     console.log(addTaxDom);

     const profitNumber = document.getElementById("profit")
     profitNumber.innerHTML = Math.floor(inputValue - taxPrice);
      //  console.log(profitNumber);
})
})