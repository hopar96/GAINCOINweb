
Won = "백만";
function comma(str) {
	str = String(str);
	return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
}
function setUpbitData() {
	$.ajax({
		url: "https://api.upbit.com/v1/market/all",
		dataType: "json"
	}).done(function(markets) {

		let arr_krw_markets = "";
		let arr_korean_name = [];
		let arr_english_name = [];
		let arr_initial = [];
		for (var i = 0; i < markets.length; i++) {
			if (markets[i].market.indexOf("KRW") > -1) {
				arr_krw_markets += markets[i].market + (",");
				arr_initial.push(markets[i].market.replace("KRW-", ""));
				arr_korean_name.push(markets[i].korean_name.replace("코인", ""));
				arr_english_name.push(markets[i].english_name.replace("코인", ""));
			}
		}

		arr_krw_markets = arr_krw_markets.substring(0, arr_krw_markets.length - 1);

		$.ajax({
			url: "https://api.upbit.com/v1/ticker?markets=" + arr_krw_markets,
			dataType: "json"
		}).done(function(tickers) {
			$("#table_ticker > tbody > tr").remove();
			$("#table_ticker").fadeOut("slow");
			for (let i = 0; i < tickers.length; i++) {
				let rowHtml = "<tr><td><img style=width:25px;height:25px; src=https://static.upbit.com/logos/" + arr_initial[i] + ".png></td><td>" + arr_english_name[i] + "</td>"
				rowHtml += "<td>" + arr_korean_name[i] + "</td>"
				if (comma((tickers[i].signed_change_rate * 100).toFixed(2)) > 0) {
					rowHtml += "<td style=color:#e71837;>" + comma(tickers[i].trade_price) + "원</td>"
					rowHtml += "<td style=color:#e71837;>" + comma((tickers[i].signed_change_rate * 100).toFixed(2)) + "%</td>"
				} else {
					rowHtml += "<td style=color:#0e4bef;>" + comma(tickers[i].trade_price) + "원</td>"
					rowHtml += "<td style=color:#0e4bef;>" + comma((tickers[i].signed_change_rate * 100).toFixed(2)) + "%</td>"
				}
				rowHtml += "<td>" + comma((tickers[i].acc_trade_price_24h > 1000000 ? (tickers[i].acc_trade_price_24h / 1000000) : tickers[i].acc_trade_price_24h).toFixed(0)) + (tickers[i].acc_trade_price_24h > 1000000 ? " " : "") + "</td>"
				rowHtml += "</tr>";
				$("#table_ticker > tbody:last").append(rowHtml);
				
			} 
			$("#table_ticker").fadeIn("fast");
		}) 
	}) 
		.fail(function() {
			//alert("업비트 API 접근 중 에러.")}
			$("#tmp").text("API 접근 중 에러.");
		})
	setTimeout(setUpbitData, 3000);
}
$(function() {
	setUpbitData();
});
