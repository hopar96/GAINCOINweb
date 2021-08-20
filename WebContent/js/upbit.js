$.ajax({
        url: "https://api.upbit.com/v1/market/all",
        dataType: "json"
      }).done(function(markets){ alert(JSON.stringify(markets)); });

var arr_krw_markets = 'KRW-BTC,KRW-ETH';
$.ajax({
          url: "https://api.upbit.com/v1/ticker?markets=" +arr_krw_markets,
          dataType: "json"
        }).done(function(tickers){ alert(JSON.stringify(tickers));  });