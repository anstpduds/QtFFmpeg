#include "widget.h"
#include "ui_widget.h"
#include "rtspthread.h"
#include <QMessageBox>

Widget::Widget(QWidget *parent) :
    QWidget(parent),
    ui(new Ui::Widget)
{
    ui->setupUi(this);
}

Widget::~Widget()
{
    delete ui;
}

void Widget::setImage(const QImage &image)
{
    QPixmap pix = QPixmap::fromImage(image);
    ui->label_2->setPixmap(pix);
}

void Widget::on_pushButton_clicked()
{
    if (ui->lineEdit->text() == 0)
    {
        QMessageBox::warning(this,"Warning","Please input address",QMessageBox::Ok);
    }
    else
    {
        QFFmpeg *f = new QFFmpeg(this);
        f->SetUrl(ui->lineEdit->text());
        if(f->Init())
        {
            connect(f,SIGNAL(GetImage(QImage)),this,SLOT(setImage(QImage)));
            RtspThread *t = new RtspThread(this);
            t->setffmpeg(f);
            t->start();
        }
        else
        {
            QMessageBox::warning(this,"Warning","Open rtsp failed",QMessageBox::Ok);
        }
    }

}
