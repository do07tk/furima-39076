window.addEventListener('load', function(){

  const usePrice = document.getElementById('profit');
  const commissionPrice = document.getElementById('add-tax-price');
  const inputPrice = document.getElementById('item-price');

  inputPrice.addEventListener('input', function(event){
    const priceValue = parseInt(event.target.value);
    if (isNaN(priceValue)) {
      const commissionValue = 0;
      commissionPrice.textContent = usePrice.textContent = commissionValue;
    } else {
      const commissionValue = Math.floor(priceValue * 0.1);
      commissionPrice.textContent = commissionValue.toLocaleString();
      const useValue = Math.floor(priceValue - commissionValue);
      usePrice.textContent = useValue.toLocaleString();
    }
  });
});
