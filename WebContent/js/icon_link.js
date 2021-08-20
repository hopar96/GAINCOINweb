
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
			//alert($("#table_ticker > tbody > tr").length);
			$("#table_ticker").fadeOut("slow");
			for (let i = 0; i < tickers.length/5; i++) {
				let rowHtml = "<tr>"
				for (let l = 0; l < 5; l++) {
					if((i*5+l)>tickers.length-1) break;
					rowHtml += "<td><a href=https://twitter.com/"+  arr_english_name[i*5+l]+ "><img style=width:150px;height:150px; src=https://static.upbit.com/logos/" + arr_initial[i*5+l] + ".png><br>" + arr_english_name[i*5+l] + "</a></td>"
				
				}
				rowHtml += "</tr>";
				$("#table_ticker > tbody:last").append(rowHtml);
				//markets[i].korean_name
			} // end for...
			$("#table_ticker").fadeIn("fast");
		})  //done(function(tickers){
	}) // end done(function(markets){
		.fail(function() {
			//alert("업비트 API 접근 중 에러.")}
			$("#tmp").text("API 접근 중 에러.");
		})

}
$(function() {
	setUpbitData();
});