require 'open-uri'
class SMSApi
  attr_accessor :client

  def initialize
    @client = Savon.client(wsdl: url)
  end

  def url
    return "" unless end_point_available?
    open(Rails.application.secrets.sms_end_point).base_uri.to_s
  end

  def authorization
    Base64.encode64("#{Rails.application.secrets.sms_username}:#{Rails.application.secrets.sms_password}")
  end

  def sms_deliver(phone_number_alt, message)
    return stubbed_response unless end_point_available?

    response = client.call(:enviar_sms_simples, message: request(phone_number_alt, message))
    success?(response)
  end

  def request(phone_number_alt, message)
    { autorizacion:  authorization,
      destinatarios: { destinatario: phone_number_alt },
      texto_mensaje: message,
      solicita_notificacion: "All" }
  end

  def success?(response)
    debugger
    #response.body[:enviar_sms_simples_return][:respuesta_servicio_externo][:texto_respuesta] == "Success"
    response.body[:enviar_sms_simples_response][:enviar_sms_simples_return][:respuesta_se][:texto_respuesta] == "Success"
  end

  def end_point_available?
    Rails.env.development? || Rails.env.preproduction? || Rails.env.production?
  end

  def stubbed_response
    {:respuesta_sms=>{:identificador_mensaje=>"1234567", :fecha_respuesta=>"Thu, 20 Aug 2015 16:28:05 +0200", :respuesta_pasarela=>{:codigo_pasarela=>"0000", :descripcion_pasarela=>"Operación ejecutada correctamente."}, :respuesta_servicio_externo=>{:codigo_respuesta=>"1000", :texto_respuesta=>"Success"}}}
  end

end