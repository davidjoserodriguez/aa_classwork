require 'sqlite3'
require 'singleton'

class QuestionsDatabase < SQLite3::Database 
    include Singleton
    
    def initialize
        super('questions.db')
        self.type_translation = true
        self.results_as_hash = true
    end
end

class User
    attr_accessor :id, :fname, :lname

    def self.find_by_id(id)
        user_id = QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT
              *
            FROM
              users
            WHERE
              id = ?
        SQL
        return nil unless user_id.length > 0

        User.new(user_id.first)
    end

    def self.find_by_name(fname, lname)
        users = QuestionsDatabase.instance.execute(<<-SQL, fname, lname) 
          SELECT
            *
          FROM
            users
          WHERE
            fname = ? AND lname = ?
        SQL
        return nil unless users.length > 0
        User.new(users.first)
    end

    def initialize(options)
        @id = options['id']
        @fname = options['fname']
        @lname = options['lname']
    end


end

class Question
    attr_accessor :id, :title, :body, :associated_author_id

    def self.find_by_id(id)
        questions = QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT
              *
            FROM
              questions
            WHERE
              id = ?
        SQL
        return nil unless questions.length > 0

        Question.new(questions.first)
    end

    def self.find_by_author_id(associated_author_id)
        questions = QuestionsDatabase.instance.execute(<<-SQL, associated_author_id)
            SELECT
              *
            FROM 
              questions
            WHERE
              associated_author_id = ?
        SQL
        return nil unless questions.length > 0
        Question.new(questions.first)
    end

    def initialize(options)
        @id = options['id']
        @title = options['title']
        @body = options['body']
        @associated_author_id = options['associated_author_id']
    end
end

class QuestionFollow
    attr_accessor :id, :user_id, :question_id

    def self.find_by_id(id)
        follows = QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT
              *
            FROM
              questions_follows
            WHERE
              id = ?
        SQL
        return nil unless follows.length > 0

        QuestionFollow.new(follows.first)
    end

    def initialize(options)
        @id = options['id']
        @user_id = options['user_id']
        @question_id = options['question_id']
    end

end

class Reply
    attr_accessor :id, :body, :reply_user_id, :question_id, :parent_reply_id

    def self.find_by_id(id)
        responses = QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT
              *
            FROM
              replies
            WHERE
              id = ?
        SQL
        return nil unless responses.length > 0
        Reply.new(responses.first)
    end

    def self.find_by_user_id(reply_user_id)
        responses = QuestionsDatabase.instance.execute(<<-SQL, reply_user_id)
          SELECT
            *
          FROM
            replies
          WHERE
            reply_user_id = ?
        SQL
        return nil unless responses.length > 0
        Reply.new(responses.first)
    end

    def self.find_by_question_id(question_id)
        responses = QuestionsDatabase.instance.execute(<<-SQL, question_id)
        SELECT
          *
        FROM
          replies
        WHERE
          question_id = ?
      SQL
      return nil unless responses.length > 0
      Reply.new(responses.first)
    end

    def initialize(options)
        @id = options['id']
        @body = options['body']
        @reply_user_id = options['reply_user_id']
        @question_id = options['quesion_id']
        @parent_reply_id = options['parent_reply_id']
    end

end

class QuestionLike
    attr_accessor :id, :user_id, :question_id
    def self.find_by_id(id)
        likes = QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT
              *
            FROM
              question_likes
            WHERE
              id = ?
        SQL
        return nil unless likes.length > 0

        QuestionLike.new(likes.first)
    end

    def initialize(options)
        @id = options['id']
        @user_id = options['user_id']
        @question_id = options['question_id']
    end
end


