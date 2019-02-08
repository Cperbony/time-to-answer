# frozen_string_literal: true

namespace :dev do

  DEFAULT_PASSWORD = 123456

  desc 'Configura o ambiente de desenvolvimento'
  task setup: :environment do
    if Rails.env.development?
      show_spinner('Apagando BD..') do
        `rails db:drop`
      end

      show_spinner('Criando Banco de Dados .....') do
        `rails db:create`
      end

      show_spinner('Migrando Tabelas .....') do
        `rails db:migrate`
      end

      show_spinner('Cadastrando adminstrador padrão .....') do
        `rails dev:add_default_admin`
      end
      show_spinner('Cadastrando usuário padrão .....') do
        `rails dev:add_default_user`
      end

    else
      puts 'Você não está em ambiente de desenvolvimento'
    end
  end

  desc 'Adiciona o administrador Padrão'
  task add_default_admin: :environment do
    Admin.create!(
      email: 'admin@admin.com',
      password: DEFAULT_PASSWORD,
      password_confirmation: DEFAULT_PASSWORD
    )
  end

  desc 'Adiciona o usuário Padrão'
  task add_default_user: :environment do
    User.create!(
      email: 'user@user.com',
      password: DEFAULT_PASSWORD,
      password_confirmation: DEFAULT_PASSWORD
    )
  end

  private

  def show_spinner(msg_start, msg_end = 'Concluído com Sucesso!')
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success("(#{msg_end})")
  end
end
