require_relative 'weather_client'
class WeatherCLI
  def initialize
    @client = WeatherClient.new
  end
  def run 
    loop do
      printf "\nHava durumunu öğrenmek istediğiniz şehir (Çıkış için 'q'): "
      city = gets.chomp.strip
      break if city.downcase == 'q'
      if city.empty?
        puts "Lütfen geçerli bir şehir adı giriniz."
        next
      end
      printf "#{city} için hava durumu sorgulanıyor...\n"
      data = @client.fetch_weather(city)
      if data 
        display_weather(data,city)
      else
        puts "Hata: Şehir bulunamadı veya API anahtarınızda bir sorun var."
      end
    end
      puts "İyi günler dileriz"
  end
  
  private 

  def display_weather(data, city)
    temp = data["main"]["temp"]
    feels_like = data["main"]["feels_like"]
    description = data["weather"][0]["description"]
    humidity = data["main"]["humidity"]

    puts "\n=============================="
    puts " 🌍 #{city.capitalize} Hava Durumu"
    puts "=============================="
    puts " Sıcaklık        : #{temp}°C"
    puts " Hissedilen      : #{feels_like}°C"
    puts " Durum           : #{description.capitalize}"
    puts " Nem Oranı       : %#{humidity}"
    puts "=============================="
  end
end


#.strip baştaki ve sondaki gereksiz boşlukları temizler
#next döngünün  o turunu bitirp başa dönmesini sağlar.
#private sonrasında tanımlanan metodlar dışarıdan doğrudan çağrılamaz
