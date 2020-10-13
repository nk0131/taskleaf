class TaskMailer < ApplicationMailer
    default from: 'kitahara@los-provide.com'
    def creation_email(task)
        @task = task
        mail(
            subject: 'タスク作成完了メール',
            to: 'kitahara@los-provide.com',
            from: 'kitahara@los-provide.com'
        )
    end
end
