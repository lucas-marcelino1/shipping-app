require 'rails_helper'

RSpec.describe RouteUpdate, type: :model do

  describe '#valid?' do
    it 'verifica se a mensagem de erro de data está inclusa' do
      @r = RouteUpdate.create()
      @r.valid?
      expect(@r.errors.full_messages).to include('Dia não pode ficar em branco')
    end

    it 'verifica se a mensagem de erro de local está inclusa' do
      @r = RouteUpdate.new()
      @r.valid?
      expect(@r.errors.full_messages).to include('Local não pode ficar em branco')
    end

    it 'verifica se a mensagem de erro de hora está inclusa' do
      @r = RouteUpdate.new()
      @r.valid?
      expect(@r.errors.full_messages).to include('Hora não pode ficar em branco')
    end

    it 'verifica se a mensagem de erro de data não poder ser anterior à hoje está inclusa' do
      @r = RouteUpdate.new(day: 1.day.ago)
      @r.valid?
      expect(@r.errors.full_messages).to include('Dia não pode ser anterior a hoje')
    end
  end
end
