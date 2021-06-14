Dado('o endereço da API para manter o cadastro de Startup') do
     #Request efetuada na classe Startup que está em Pages
  end
  
Quando('realizar uma requisição para cadastrar uma startup') do
    $response = @startup.postStartup
end
  
Então('a API irá retornar os dados do cadastro da Startup respondendo o código {int}') do |int|
    expect($response.code).to eq(201)
    puts "Response code: #{$response.code}"
    expect($response.message).to eq("Created")
    puts "Response Message: #{$response.message}"

    puts "ID     : #{$response["id"]}"
    puts "Nome   : #{$response["nome"]}"
    puts "Cidade : #{$response["cidade"]}"

    $id = $response["id"]
end

Quando("realizar uma requisição passando o ID da startup") do
    $get = @startup.getStartup($id)
end
  
Então("a API irá retornar os dados da Startup correspondente respondendo o código {int}") do |int|
    expect($get.code).to eq(int)
    expect($get.message).to eq("OK")
    expect($get["id"]).to eq($response["id"])

    puts "ID    : #{$get["id"]}"
    puts "Nome  : #{$get["nome"]}"
    puts "Cidade: #{$get["cidade"]}"
    puts "Status Code: #{$get.code}"
end

Quando("realizar uma requisição para alterar uma startup") do
    $put = @startup.putStartup($get["id"])
end

Então("a API irá retornar os dados da Startup alterados respondendo o código {int}") do |int|
    expect($put.code).to eq(int)
    expect($put.message).to eq("OK")
    expect($put["id"]).to eq($response["id"])

    puts "ID    : #{$put["id"]}"
    puts "Nome  : #{$put["nome"]}"
    puts "Cidade: #{$put["cidade"]}"
    puts "Status Code: #{$put.code}"
end

Quando("realizar uma requisição para excluir uma startup") do
    $delete = @startup.deleteStartup($put["id"])
  end
  
  Então("a API deverá retornar os dados da exclusão respondendo o código {int}") do |int|
      expect($delete.code).to eq(int)
      expect($delete.message).to eq("OK")
  
  
      puts "ID    : #{$delete["id"]}"
      puts "Nome  : #{$delete["nome"]}"
      puts "Cidade: #{$delete["cidade"]}"
      puts "Status Code: #{$delete.code}"
  end