# Projeto de Banco de Dados Escolar

Este projeto é um sistema de gerenciamento escolar desenvolvido em **SQL**, que abrange desde a criação de tabelas até consultas avançadas e manipulação de dados. Ele foi criado como parte do meu aprendizado em banco de dados durante a escola, e aqui estão os principais conceitos aplicados:

---

## **Conceitos Aplicados**

### 1. **Modelagem de Dados**
   - **Entidades e Relacionamentos**: O projeto define entidades como `PESSOAS`, `ALUNO`, `PROFESSOR`, `TURMA`, `DISCIPLINA`, `ANO_LETIVO` e `MATRICULA`, com relacionamentos bem estruturados.
   - **Chaves Primárias e Estrangeiras**: Uso de `PRIMARY KEY` e `FOREIGN KEY` para garantir a integridade referencial entre as tabelas.
   - **Normalização**: As tabelas estão normalizadas para evitar redundâncias e inconsistências.

### 2. **Manipulação de Dados**
   - **Inserção de Dados**: Uso de `INSERT INTO` para popular as tabelas com dados iniciais.
   - **Atualização de Dados**: Comandos `UPDATE` para modificar registros existentes.
   - **Exclusão de Dados**: Uso de `DELETE` para remover registros específicos.
   - **Consultas Básicas**: `SELECT` para recuperar dados das tabelas.

### 3. **Consultas Avançadas**
   - **Joins**: Uso de `INNER JOIN` para combinar dados de múltiplas tabelas.
   - **Funções Agregadas**: `COUNT`, `AVG`, `MAX` para análises estatísticas.
   - **Filtros e Ordenação**: `WHERE`, `LIKE`, `IN`, `ORDER BY` para filtrar e ordenar resultados.
   - **Consultas Complexas**: Combinação de múltiplas tabelas e condições para gerar relatórios detalhados.

### 4. **Gerenciamento de Estruturas**
   - **Criação de Tabelas**: Uso de `CREATE TABLE` para definir a estrutura do banco de dados.
   - **Alteração de Tabelas**: Comandos `ALTER TABLE` para adicionar ou modificar colunas.
   - **Exclusão de Tabelas**: `DROP TABLE` para remover tabelas (usado com cautela).

### 5. **Integridade e Segurança**
   - **Restrições de Integridade**: Uso de `NOT NULL`, e chaves estrangeiras para garantir a consistência dos dados.
   - **Transações**: Embora não explicitamente mostrado, o projeto segue boas práticas para garantir a atomicidade das operações.

---

## 🛠️ **Estrutura do Banco de Dados**

### Tabelas Principais
1. **PESSOAS**: Armazena informações básicas de pessoas (alunos, professores, etc.).
2. **ALUNO**: Relaciona alunos com suas informações específicas (RM, e-mail institucional).
3. **PROFESSOR**: Armazena dados dos professores (especialidade, data de admissão).
4. **TURMA**: Define as turmas e seu ano letivo correspondente.
5. **DISCIPLINA**: Lista as disciplinas oferecidas.
6. **ANO_LETIVO**: Define os anos letivos com datas de início e término.
7. **MATRICULA**: Registra as matrículas dos alunos em turmas específicas.
8. **TURMADISCIPLINA**: Relaciona turmas, disciplinas e professores.

### Exemplos de Consultas
- **Listar Alunos Matriculados**:
  ```sql
  SELECT PESSOAS.nome, PESSOAS.sobrenome, ALUNO.RM, TURMA.nome AS Turma
  FROM PESSOAS
  INNER JOIN ALUNO ON PESSOAS.idpessoa = ALUNO.IDPESSOA
  INNER JOIN MATRICULA ON ALUNO.RM = MATRICULA.RM
  INNER JOIN TURMA ON MATRICULA.IDTURMA = TURMA.idturma;
  ```

- **Listar Professores e Suas Disciplinas**:
  ```sql
  SELECT PESSOAS.nome AS Professor, DISCIPLINA.nome AS Disciplina
  FROM PROFESSOR
  INNER JOIN PESSOAS ON PROFESSOR.IDPESSOA = PESSOAS.idpessoa
  INNER JOIN TURMADISCIPLINA ON PROFESSOR.IDPROFESSOR = TURMADISCIPLINA.IDPROFESSOR
  INNER JOIN DISCIPLINA ON TURMADISCIPLINA.IDDISCIPLINA = DISCIPLINA.iddisciplina;
  ```

- **Média de Idade dos Alunos**:
  ```sql
  SELECT AVG(idade) AS Media_Idade
  FROM PESSOAS
  INNER JOIN ALUNO ON PESSOAS.idpessoa = ALUNO.IDPESSOA;
  ```

---

## **Como Executar o Projeto**

1. **Requisitos**:
   - Um SGBD compatível com SQL (ex: MySQL, PostgreSQL, SQL Server).
   - Ferramenta de execução de scripts SQL (ex: MySQL Workbench, pgAdmin, SSMS).

2. **Passos**:
   - Crie um banco de dados vazio.
   - Execute o script SQL fornecido para criar as tabelas e inserir os dados iniciais.
   - Use as consultas de exemplo para explorar os dados.

---

## **Aprendizados e Destaques**

Este projeto consolidou meus conhecimentos em:
- **Modelagem de Banco de Dados**: Aprendi a projetar um banco de dados escalável e eficiente.
- **SQL Avançado**: Dominei consultas complexas, joins e funções agregadas.
- **Boas Práticas**: Apliquei conceitos de normalização e integridade referencial.
- **Resolução de Problemas**: Desenvolvi habilidades para resolver desafios de manipulação e análise de dados.

---

## **Contribuições**

Contribuições são bem-vindas! Sinta-se à vontade para abrir issues ou pull requests com sugestões, correções ou novas funcionalidades.

---

## **Contato**

Se tiver alguma dúvida ou sugestão, entre em contato:
- **Email**: [joaovictorfernandesgolim@gmail.com]
- **LinkedIn**: [João Victor Fernandes Golim]

---

Feito por [João Victor].  
Última atualização: [11/03/2025].
