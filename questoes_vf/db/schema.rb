# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130331164030) do

  create_table "alunos", :force => true do |t|
    t.integer  "redu_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "alunos_provas", :id => false, :force => true do |t|
    t.integer "aluno_id"
    t.integer "prova_id"
  end

  add_index "alunos_provas", ["aluno_id", "prova_id"], :name => "index_alunos_provas_on_aluno_id_and_prova_id"
  add_index "alunos_provas", ["prova_id", "aluno_id"], :name => "index_alunos_provas_on_prova_id_and_aluno_id"

  create_table "comentarios", :force => true do |t|
    t.integer  "questao_id"
    t.integer  "aluno_id"
    t.text     "texto"
    t.decimal  "ranking"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "comentarios", ["aluno_id"], :name => "index_comentarios_on_aluno_id"
  add_index "comentarios", ["questao_id"], :name => "index_comentarios_on_questao_id"

  create_table "proposicaos", :force => true do |t|
    t.integer  "questao_id"
    t.boolean  "resposta"
    t.text     "texto"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "proposicaos", ["questao_id"], :name => "index_proposicaos_on_questao_id"

  create_table "provas", :force => true do |t|
    t.integer  "professor_id"
    t.integer  "disciplina_id"
    t.integer  "aula_id"
    t.string   "titulo"
    t.text     "cabecalho"
    t.text     "rodape"
    t.boolean  "justificar_falsa"
    t.boolean  "justificar_verdadeira"
    t.integer  "qtd_verdadeira_anula"
    t.integer  "qtd_falsa_para_anular"
    t.datetime "data_inicio"
    t.datetime "disponivel_data_inicio"
    t.datetime "disponivel_data_fim"
    t.integer  "duracao"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
  end

  create_table "questaos", :force => true do |t|
    t.integer  "prova_id"
    t.text     "enunciado"
    t.text     "explicacao"
    t.boolean  "visibilidade"
    t.decimal  "valor"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "questaos", ["prova_id"], :name => "index_questaos_on_prova_id"

  create_table "resposta", :force => true do |t|
    t.integer  "proposicao_id"
    t.integer  "aluno_id"
    t.boolean  "resposta"
    t.text     "comentario"
    t.text     "explicacao"
    t.datetime "data"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "resposta", ["aluno_id"], :name => "index_resposta_on_aluno_id"
  add_index "resposta", ["proposicao_id"], :name => "index_resposta_on_proposicao_id"

end
