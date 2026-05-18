print "Digite seu codenome Hacker: "
nome_hacker = gets.chomp

puts "1 - Servidores da Mihomo (Vingar Lutaw)"
puts "2 - Banco de Dados da Mihoyo"
escolha = gets.chomp

case escolha
when "1"
    puts "Invadindo Mihomo!"
    sorte = rand(1..10)
    if sorte >= 4
    puts "Estamos dentro do servidor. Agora quais dados queremos rou-pegar emprestado?"
        puts "1 - Uid secretos dos jogadores"
        puts "2 - Nos colocar sempre com prioridade na vila, hehehe..."
        dados = gets.chomp
        case dados
        when "1"
            puts "Boa #{nome_hacker}! Estamos com os Uids em mãos, hack bem sucedido!"
        when "2"
            puts "É ISSO AI!!! NOS QUE MANDAMOS NESSA FILA AGORA!"
        end
    else
        puts "OPS! Alerta vermelho O_O"
        sleep 1
        puts "VIsh, o Firewall apitou..."
        sleep 1.5
        puts "Parabéns, #{nome_hacker}! vc puxou o aggro com sucesso!"
        sleep 2
        puts "Loopa os cara, cotinue ta incrivelmente engraçado assistir vc correr! LOL"
        sleep 3
        puts "Vou raspar nossas jades do servidor e abrir a saida agora. Te vejo no Expresso Astral, #{nome_hacker} (ou melhor chamar de noob hehehe)!"
    end
when "2"
    puts "Eai, o que fazemos nessa budega agora? bora jogar um osu?"
    puts "1 - Hackear as jades das nossas contas"
    puts "2 - Apagar o 50/50 pra sempre"
    puts "3 - Jogar com a lobinha..."
    hack = gets.chomp
    case hack
    when "1"
        puts "Cade nossas jades hoyo pelo resgate?"
    when "2"
        puts "SEM MAIS YAQING NA MINHA CONTA! >_<"
    when "3"
        puts "Bora X1 no Tekken valendo um refri? Y/N"
        resposta = gets.chomp.upcase
        if resposta == "Y"
            puts "Vc aceitou a aposta msm sendo tão ruim de panda assim? LOL" 
        elsif resposta == "N"
            puts "Amarelão ~_~"
        else
            puts "Responde direito, noob! É Y ou N!"
        end
    else
        puts "Eu vou hackear tua conta bancaria se ficar de enrolação!"
    end
else
    puts "Deixa de brincadeira! Vamos hacker sério (ou nem tanto...)"
end

