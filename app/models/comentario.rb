# encoding: utf-8
class Comentario < ActiveRecord::Base
  belongs_to :questao
  belongs_to :aluno

  def pretty_date
  	a = (Time.now-self.created_at).to_i
  	retorno = ''

    case a
      when 0 then retorno = 'agora mesmo'
      when 1 then retorno = 'um segundo atrás'
      when 2..59 then retorno = a.to_s+' segundos atrás' 
      when 60..119 then retorno = 'um minuto atrás'
      when 120..3540 then retorno = (a/60).to_i.to_s+' minutos atrás'
      when 3541..7100 then retorno = 'uma hora atrás'
      when 7101..82800 then retorno = ((a+99)/3600).to_i.to_s+' horas atrás' 
      when 82801..172000 then retorno = 'um dia atrás'	
      when 172001..518400 then retorno = ((a+800)/(60*60*24)).to_i.to_s+' dias atrás'
      when 518400..1036800 then 'retorno = uma semana atrás'
      else retorno = ((a+180000)/(60*60*24*7)).to_i.to_s+' semanas atrás'
    end
  end

  def get_nome
    return User.find_by_uid(self.aluno_id).name
  end
end

