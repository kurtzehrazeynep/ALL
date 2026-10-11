require 'httparty'
require 'json'

class WeatherClient #hava durumu API siyle konusacak bir ruby nesnesi oluşturmak
  include HTTParty 
  base_uri 'https://api.openweathermap.org/data/2.5'
  def initialize
    @api_key = ENV['WEATHER_API_KEY']
  end
  def fetch_weather(city)
    response = self.class.get("/weather", query: {
      q: city,
      appid: @api_key,
      units: 'metric',
      lang: 'tr'
    })
    #JSON FORMATINDA GÖRMEK İÇİN 
    #puts "API'den gelen ham yanıt: #{response.body}"
    response.code == 200 ? JSON.parse(response.body) : nil
  end
end

#API nin temel adresini belirliyoruz 
#base_uri 'https://api.openweathermap.org/data/2.5'
#Burada API'nin temel URL'sini belirliyoruz.
#API adresimiz: base_uri 'https://api.openweathermap.org/data/2.5'
#ama hava durumu bilgisi için API'nin
#/weather 
#endpoint'ine gitmemiz gerekiyor.
#Yani tam adres:
#https://api.openweathermap.org/data/2.5/weather
#Fakat kodda tamamını tekrar tekrar yazmıyoruz
#Şunu yazıyoruz
#base_uri 'https://api.openweathermap.org/data/2.5'
#sonrasında:
#self.class.get("/weather")
#yazınca HTTPparty bunları birleştiriyor.
#base_uri
#  ↓
#https://api.openweathermap.org/data/2.5

#"/weather"
#  ↓
#/weather

#SONUÇ
#   ↓
#https://api.openweathermap.org/data/2.5/weather
#
#self.class.get(...) burada GET HTTP isteği yapılıyor
#GET'in anlamı kabaca: "sunucudan bana bilgi gönder"
#Hava durumu bilgisini almak istediğimiz için GET kullanıyoruz.
#"/weather"
#self.class.get("/weather")
#buradadki 
#"/weather" API endpointt'idir.
#Daha önce:
#base uri '.....' demiştik
#Dolayısıyla:
#"/weather"
#eklenince:
# https://api.openweathermap.org/data/2.5/weather oluyor
# querry: { q: city , appid: @api_key, units: 'metric', lang: 'tr' }
# Bunlar URL ' ye gönderilecek parametrelerdir
# Normalde URL yaklaşık olarak şöyle görünür:
# https://api.openweathermap.org/data/2.5/weather
# Ruby de bunu elle yazmak yerine:
# query: {...}
# şeklinde veriyoruz
# HTTParty URL yi bizim için oluşturuyor.
# q, OpenWeather API'sinde hangi şehrn aranacağını belirtir.
# appid: @api_key API anahtarınım bu der
# units: sıcaklık birimini belirliyoruz
# lang: 'tr' API den gelen bazı açıklamaların Türkçe olmasını isteriz
# response nedir?
# API ye istek gönderdikten sonra sunucudan bir cevap (response) geliyor.
# bu değişkeni response değişkenine koyuyoruz.
# Örneğin API başarılı bir cevap dödürürse response içerisinde:
# HTTP Status: 200
# Body:JSON verisi
# gibi bilgiler bulunur
# response.code
# response.code == 200
# Burada API nin HTTP durum kodunu kontrol ediyoruz:
# 200 : istek başarılı
# anlamına gelir
# Örneğin 
# response şu değeri döndürürse : 200 API den başarılı cevap gelmiştir.
# Ama örneğin:
# 404 gelirse kaynak bulunamamıştır.
# response.body 
# API den gelen asıl veri gövdesidir
# Bu veri başlangıcta JSON formatındadır
# JSON.parse 
# JSON.parse(response.body) JSON verisini Ruby'nin kullanabileceği bir yapıya dönüştürür.
# Hash haline gelir
# sonrasında data = weather.fetch_weather("Samsun") gibi bir kullanım yapıp 
# data["name"]
# ile şehir adına ulaşırız
# 
#WeatherClient oluştur
#        ↓
#initialize çalışır
#        ↓
#API anahtarını ENV'den al
#        ↓
#fetch_weather("Samsun") çağır
#        ↓
#Samsun bilgisini al
#        ↓
#OpenWeather API'ye GET isteği gönder
#        ↓
#API cevap verir
#        ↓
#response.code kontrol edilir
#        ↓
#     200 mü?
#      /   \
#    EVET   HAYIR
#     ↓       ↓
#JSON.parse  nil
#     ↓
#Ruby Hash 
#
#
#response.code -> Cevabın durum kodu.Örneğin  200
#response.body -> Sunucunun gönderdiği verinin kendisi
#response.headers -> Cevapla ilgili başlık bilgileri
#