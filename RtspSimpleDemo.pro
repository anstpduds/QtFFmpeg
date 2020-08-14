#-------------------------------------------------
#
# Project created by QtCreator 2016-07-18T13:53:20
#
#-------------------------------------------------

QT       += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = RtspSimpleDemo
TEMPLATE = app


SOURCES += main.cpp\
        widget.cpp \
    qffmpeg.cpp \
    rtspthread.cpp

HEADERS  += widget.h \
    qffmpeg.h \
    rtspthread.h

FORMS    += widget.ui

INCLUDEPATH +=  $$PWD/ffmpeg/include
LIBS += -L$$PWD/ffmpeg/lib/ -lavfilter
LIBS += -L$$PWD/ffmpeg/lib/ -lavdevice
LIBS += -L$$PWD/ffmpeg/lib/ -lavcodec
LIBS += -L$$PWD/ffmpeg/lib/ -lavformat
LIBS += -L$$PWD/ffmpeg/lib/ -lavutil
LIBS += -L$$PWD/ffmpeg/lib/ -lpostproc
LIBS += -L$$PWD/ffmpeg/lib/ -lswresample
LIBS += -L$$PWD/ffmpeg/lib/ -lswscale

QMAKE_CXXFLAGS += /utf-8

DESTDIR=bin


