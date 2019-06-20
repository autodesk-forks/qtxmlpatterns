TEMPLATE=subdirs
QT_FOR_CONFIG += xmlpatterns-private
SUBDIRS=\
           checkxmlfiles                \
           cmake                        \
           patternistexamplefiletree    \
           patternistexamples           \
           patternistheaders            \
           qabstractmessagehandler      \
           qabstracturiresolver         \
           qabstractxmlforwarditerator  \
           qabstractxmlnodemodel        \
           qabstractxmlreceiver         \
           qapplicationargumentparser   \
           qautoptr                     \
           qsimplexmlnodemodel          \
           qsourcelocation              \
           qxmlformatter                \
           qxmlitem                     \
           qxmlname                     \
           qxmlnamepool                 \
           qxmlnodemodelindex           \
           qxmlquery                    \
           qxmlresultitems              \
           qxmlserializer               \
           xmlpatterns                  \
           xmlpatternsdiagnosticsts     \
           xmlpatternssdk               \
           xmlpatternsvalidator         \
           xmlpatternsview              \
           xmlpatternsxqts              \
           xmlpatternsxslts             \

qtConfig(xml-schema) {
    SUBDIRS += qxmlschema               \
               qxmlschemavalidator      \
               xmlpatternsschema        \
               xmlpatternsschemats
}

xmlpatternsdiagnosticsts.depends = xmlpatternssdk
xmlpatternsview.depends = xmlpatternssdk
xmlpatternsxslts.depends = xmlpatternssdk
xmlpatternsxqts.depends = xmlpatternssdk
xmlpatternsschemats.depends = xmlpatternssdk
xmlpatternsxqts.depends = xmlpatternssdk

!contains(QT_CONFIG, private_tests): SUBDIRS -= \
           xmlpatternsdiagnosticsts \
           xmlpatternsview \
           xmlpatternsschemats \
           xmlpatternssdk \
           xmlpatternsxqts \
           xmlpatternsxslts \

qtHaveModule(quick): SUBIDIRS += qquickxmllistmodel

!cross_compile:                             SUBDIRS += host.pro

# these tests depend on auxiliary files to be deployed so they
# fail on Android. Given the state of the module, we simply
# disable them - the code is already tested on regular Linux.
android: SUBDIRS-= checkxmlfiles \
                   patternistexamples \
                   qabstractxmlnodemodel \
                   qxmlquery

