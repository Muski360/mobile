# Aula 27/01

Criamos usuários '2DevSESI' para nós podermos utilizar esse computador, configuramos senha e configurações iniciais.

Instalamos VSCode, logamos no GitHub, criamos Profiles Web e Flutter para facilitar a troca quando formos escrever outra linguagem de programação.
Depois, instalamos o Live Share que permite o Host compartilhar o terminal e arquivos, facilitando a visualização de toda a sala.

Posteriormente, fizemos a votação de representante.

Além disso, criamos nossa pasta, com o nome de 'MuriloDB' e criei diretórios de todas as matérias do semestre, juntamente com um README.md
Instrução:
Para entrar em um diretório, utilize: 'cd (nome da pasta)'
'mkdir' para criar um diretório.
'new-item' para criar um arquivo.

Assim, criamos esse README.md somente pelo terminal.

# Aula 03/02

## Tipo de Desenvolvimento

- Nativo
    - Android:
        - SDK : Android SDK
        - IDE : Android Studio
        - Linguagens: Kotlin / Java
        - Ambientes: Mac, Win, Linux

    - Ios:
        - SDK: Cocoa Touch
        - IDE: Xcode
        - Liguagens: Swift / Objective -C
        - Ambientes: Mac

- Multiplataforma
    - React Native:
        - SDK: Node.JS
        - IDE: VSCode
        - Linguagens: JavaScript / TypeScript
        - Ambientes: Mac, Win, Linux
    
    - Flutter
        - SDK: Flutter SDK
        - IDE: VSCode, Android Studio
        - Linguagens: Dart
        - Ambiente: Mac, Win, Linux

# Aula 10/02

## Preparação do Ambiente de Desenvolvimento

### Instalação do FlutterSDK
- download do arquivo ZIP na página flutter.dev
- inclusão do flutter na pasta C:\src
- inclusão do flutter\bin nas varáveis de ambiente
- teste o flutter --version

### Instalação do AndroidSDK
- download do Android SDK - Command Line Tools
- adicionar o Command-line ao c:\src\AndroidSDK
- adicionar o SDKManager as Variáveis de Ambiente
- download dos pacotes
    - emulador
    - platforms
    - platform-tools
    - build-tools
- adicionar ADB e o Emulator as Variáveis de Ambiente
- Criação da Imagem do Emulador - via sdkmanager
- Build do Emulador - via sdkmanager

### Criação de Projetos e Códigos da Linha de Comando

- criação de projetos
    - flutter create nome_do_app
        - flags(parâmetros):
            - --empty : Cria um aplicativo "vazio"(hello World!)
            - --platforms : permite a seleção de uma plataforma de desenvolvimento
                - ex: --platforms=android (a criação do projeto será somente para a plataforma android)
    - exemplo de criação de uma aplicativo android vazio
        - flutter create nome_do_app --empty --platforms=android
        - obs: nome do aplicativo: todas as letras minúsculas, separação de palavras com "_";
    - flutter doctor
        - permite correção de pequenos problemas no flutter e identificação dos parâmetros funcionais em relação as plataforma de desenvolvimento
    - flutter clean
        - limpa cache do build(apaga o apk anterior)
    - flutter run -v 
        - build do app (apk)
