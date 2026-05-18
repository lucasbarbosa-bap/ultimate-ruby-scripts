require 'tty-prompt'
require 'colorize'

class Estudante
  attr_accessor :nome, :talento, :minha_nota, :status
    def initialize (nome_passado, talento_passado, nota_passada)
            @nome = nome_passado
            @talento = talento_passado
            @minha_nota  = nota_passada
            @status = "Vivo"
    end
end

lista_alunos = [
  Estudante.new("Ibuki Mioda", "Musician", "10"),
  Estudante.new("Mikan Tsumiki", "Nurse", "10"),
  Estudante.new("Chiaki Nanami", "Gamer", "10"),
  Estudante.new("Nagito Komaeda", "Lucky Student", "Esperança/10"),
  Estudante.new("Hajime Hinata", "???", "8"),
  Estudante.new("Hiyoko Saionji", "Traditional Dancer", "2")
]

menu = TTY::Prompt.new
loop do
  system("clear") || system("cls")
    escolha = menu.select("O que deseja fazer?",
    [
      "Ver Alunos",
      "Cadastrar Aluno",
      "Executar Aluno",
      "Sair".red => "Sair"
    ]
  )

  puts "Vc Escolheu: #{escolha}"
  case escolha
  when "Cadastrar Aluno"
    
    nome_digitado = ""

    loop do
      nome_digitado = menu.ask("Qual o nome do ultimate?")
        nome_repetido = lista_alunos.any? { |aluno| aluno.nome.downcase == nome_digitado.downcase}
        if nome_repetido
          puts "Puhuhu! Este aluno já foi exec-Cadastrado!".red
          sleep 1
        else
          break
        end
    end

    talento_digitado = menu.ask("Qual o talento?")
    nota_digitada = menu.ask("Qual sua nota pra ele?")
    puts "Aluno: #{nome_digitado} Cadastrado com sucesso!"
    sleep 1
  lista_alunos << Estudante.new(nome_digitado, talento_digitado, nota_digitada)

  when "Ver Alunos"
    if lista_alunos.empty?
      puts "Puhuhuhu! A ilha está vazia, não há quem punir (ainda)!".red
    else
      puts "====== Academy Hope's Peak ✨ ======".yellow
      lista_alunos.each do |aluno|
        cor_nome = aluno.nome == "Mikan Tsumiki" ? aluno.nome.light_magenta + '💜' : aluno.nome
        cor_status = aluno.status == "Vivo" ? aluno.status.green : aluno.status.red
        puts "[#{cor_status}] Nome: #{cor_nome} | Avaliação: #{aluno.minha_nota} | Ultimate #{aluno.talento.cyan}"
      end
      sleep 1.5
    end
  when "Executar Aluno"
    
    lista_nomes = lista_alunos.map{ |aluno| aluno.nome}
    aluno_morto = menu.select("Qual aluno será executado?", lista_nomes)
    aluno_encontrado = lista_alunos.find{ |aluno| aluno.nome == aluno_morto }
    if aluno_encontrado.status != "Morto"
      aluno_encontrado.status = "Morto"
      puts "Punição executada com sucesso! Bye bye, #{aluno_encontrado.nome}!".green
      sleep 1.25
    else
      puts "Que determinação para executar alguém duas vezes, A-M-E-I!".red
    end
    sleep 1.25
  end

  break if escolha == "Sair"
  
end
