const price = () => {
	const priceInput = document.getElementById("item-price");
	const taxPrice = document.getElementById("add-tax-price");
	const profit = document.getElementById("profit");

	if (!priceInput) return;

	priceInput.addEventListener("input", () => {
		const inputValue = priceInput.value;
		const fee = Math.floor(inputValue * 0.1);
		const profitAmount = inputValue - fee;

		taxPrice.innerHTML = fee.toLocaleString();
		profit.innerHTML = profitAmount.toLocaleString();
	});
};

window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);
