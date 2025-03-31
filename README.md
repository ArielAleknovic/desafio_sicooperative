# Projeto SiCooperative LTDA

## Objetivo do Projeto
Democratizar o acesso aos dados do Lake da empresa SiCooperative LTDA.

## Principais Componentes
- **Banco de Dados PostgreSQL**: Escolhi esta ferramenta devido à minha familiaridade com sua configuração e utilização, além de sua ampla adoção no mercado.
- **Processamento Distribuído com Apache Spark**: A escolha do Apache Spark se baseia na minha familiaridade com a ferramenta e na sua popularidade no mercado. Esses fatores determinaram a escolha desta ferramenta.
- **Armazenamento de Objetos com Apache MinIO**: Decidi adicionar essa ferramenta visando tornar o acesso aos dados mais democrático. Minha experiência prévia com MinIO em projetos acadêmicos foi um fator determinante para essa escolha.

## Decisões de Projeto
- Decidi manter os scripts `.sql` separados, com o objetivo de tornar o modelo mais modular. Dessa forma, os scripts podem ser geridos ou mantidos fora do projeto, enquanto o código da aplicação pode executar as consultas com maior escalabilidade.
- Embora seja considerado um bônus, o projeto foi idealizado justamente com Docker, visando a facilidade no provisionamento do ambiente.

## Melhorias Planejadas
- **Automatizar a criação de buckets**: Possivelmente utilizando o Dockerfile.
- **Implementar testes unitários**: Como não tenho experiência com testes unitários, optei por não incluir uma modelagem que representasse um conceito que ainda não domino.
- **Tornar o código mais seguro**: Usar o arquivo `.env` ou outras abordagens para evitar a exposição de credenciais e outras informações sensíveis.
