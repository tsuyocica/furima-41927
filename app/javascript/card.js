const pay = () => {
	const publicKey = gon.public_key;
	const payjp = Payjp(publicKey); // PAY.JPテスト公開鍵
	const elements = payjp.elements();
	const numberElement = elements.create("cardNumber");
	const expiryElement = elements.create("cardExpiry");
	const cvcElement = elements.create("cardCvc");

	numberElement.mount("#number-form");
	expiryElement.mount("#expiry-form");
	cvcElement.mount("#cvc-form");

	const form = document.getElementById("charge-form");
	form.addEventListener("submit", (e) => {
		payjp.createToken(numberElement).then(function (response) {
			if (response.error) {
			} else {
				const token = response.id;
				const renderDom = document.getElementById("charge-form");
				const tokenObj = `<input value=${token} name='token' type="hidden">`; // tokenの値をparamsに含め,非表示
				renderDom.insertAdjacentHTML("beforeend", tokenObj);
			}
			// フォームの値を削除
			numberElement.clear();
			expiryElement.clear();
			cvcElement.clear();
			// フォームの送信
			document.getElementById("charge-form").submit();
		});
		e.preventDefault();
	});
};

window.addEventListener("turbo:load", pay);
window.addEventListener("turbo:render", pay);
