import QtQuick 2.12
import QtQuick.Controls 2.5

Item {
    id: root
    property real borderWidth: 0.01
    property var months:[qsTr("January"), qsTr("February"), qsTr("March"), qsTr("April"), qsTr("May"), qsTr("June"), qsTr("July"),
        qsTr("August"), qsTr("September"), qsTr("October"), qsTr("November"), qsTr("December")]
    property var monthsShort:[qsTr("Jan"), qsTr("Feb"), qsTr("Mar"), qsTr("Apr"), qsTr("May"), qsTr("Jun"), qsTr("Jul"),
        qsTr("Aug"), qsTr("Sep"), qsTr("Oct"), qsTr("Nov"), qsTr("Dec")]

    property color listsBackground: "transparent"
    property color selectedItemColor: "transparent"
    property color selectedItemTextColor: "black"
    property color itemTextColor: "darkgrey"
    property color delimitersColor: "orange"
    property int lastYear: new Date().getFullYear()
    property var date: new Date('1999-12-31');
    property int moveVelocity: 100
    property int maxMoveDuration: 1000

    function updateDays(){
        var d = new Date(lastYear-years_lv.currentIndex, months_lv.currentIndex+1, 0).getDate();
        var last_index=days_lv.currentIndex
        days_lv.model=d
        days_lv.highlightMoveDuration=1
        days_lv.highlightMoveVelocity=-1
        if(last_index<d){
            days_lv.currentIndex=last_index
        }
        else{
            days_lv.currentIndex=d
        }
        days_lv.highlightMoveDuration=maxMoveDuration
        days_lv.highlightMoveVelocity=moveVelocity
    }

    Component.onCompleted: {
        years_lv.currentIndex=lastYear-date.getFullYear()
        months_lv.currentIndex=date.getMonth()
        while(years_lv.currentIndex!=lastYear-date.getFullYear() || months_lv.currentIndex!=date.getMonth()){}
        days_lv.currentIndex=date.getDate()
    }

    Row{
        anchors.fill: parent
        spacing: borderWidth*root.width
        anchors.margins: borderWidth*root.width
        Rectangle{
            width: root.width/3
            height: parent.height
            clip: true
            ListView{
                id: days_lv
                model: 31
                anchors.fill: parent
                //currentIndex:date.getDay()
                highlightMoveDuration: maxMoveDuration
                highlightMoveVelocity: moveVelocity
                header:Rectangle{
                    color: listsBackground
                    height: root.height/3
                    width: parent.width
                }
                footer:Rectangle{
                    color: listsBackground
                    height: root.height/3
                    width: parent.width
                }

                delegate:
                    Rectangle{
                    color: selectedItemColor
                    height: root.height/3
                    width: parent.width
                    Label {
                        text: index+1
                        font.pointSize: root.width/20
                        color: days_lv.currentIndex==index?selectedItemTextColor:itemTextColor
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        anchors.fill: parent
                    }

                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            days_lv.currentIndex=index
                        }
                    }

                }
                preferredHighlightBegin: root.height/3
                preferredHighlightEnd: 2*root.height/3
                highlightRangeMode: ListView.StrictlyEnforceRange
                highlight: Item{
                    height: root.height/3
                    width: parent.width
                    Rectangle{
                        color: delimitersColor
                        width: parent.width
                        height: parent.height/20
                        anchors.top: parent.top
                    }
                    Rectangle{
                        color: delimitersColor
                        width: parent.width
                        height: parent.height/20
                        anchors.bottom: parent.bottom
                    }
                }
            }
            color: listsBackground
        }


        Rectangle{
            width: root.width/3
            height: parent.height
            clip: true
            ListView{
                id: months_lv
                model: 12
                anchors.fill: parent
                //currentIndex:date.getMonth()
                highlightMoveDuration: maxMoveDuration
                highlightMoveVelocity: moveVelocity
                header:Rectangle{
                    color: listsBackground
                    height: root.height/3
                    width: parent.width
                }
                footer:Rectangle{
                    color: listsBackground
                    height: root.height/3
                    width: parent.width
                }

                delegate:
                    Rectangle{
                    color: selectedItemColor
                    height: root.height/3
                    width: parent.width
                    Label {
                        text: monthsShort[index]
                        font.pointSize: root.width/20
                        color: months_lv.currentIndex==index?selectedItemTextColor:itemTextColor
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        anchors.fill: parent
                    }

                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            months_lv.currentIndex=index
                        }
                    }

                }
                onCurrentIndexChanged: {
                    updateDays()
                }

                preferredHighlightBegin: root.height/3
                preferredHighlightEnd: 2*root.height/3
                highlightRangeMode: ListView.StrictlyEnforceRange
                highlight: Item{
                    height: root.height/3
                    width: parent.width
                    Rectangle{
                        color: delimitersColor
                        width: parent.width
                        height: parent.height/20
                        anchors.top: parent.top
                    }
                    Rectangle{
                        color: delimitersColor
                        width: parent.width
                        height: parent.height/20
                        anchors.bottom: parent.bottom
                    }
                }
            }
            color: listsBackground
        }

        Rectangle{
            width: root.width/3
            height: parent.height
            clip: true
            ListView{
                id: years_lv
                model: 200
                anchors.fill: parent
                //currentIndex:lastYear-date.getFullYear()
                highlightMoveDuration: maxMoveDuration
                highlightMoveVelocity: moveVelocity
                header:Rectangle{
                    color: listsBackground
                    height: root.height/3
                    width: parent.width
                }
                footer:Rectangle{
                    color: listsBackground
                    height: root.height/3
                    width: parent.width
                }

                delegate:
                    Rectangle{
                    color: selectedItemColor
                    height: root.height/3
                    width: parent.width
                    Label {
                        text: lastYear-index
                        font.pointSize: root.width/20
                        color: years_lv.currentIndex==index?selectedItemTextColor:itemTextColor
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        anchors.fill: parent
                    }

                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            years_lv.currentIndex=index
                        }
                    }

                }
                onCurrentIndexChanged: {
                    updateDays()
                }
                preferredHighlightBegin: root.height/3
                preferredHighlightEnd: 2*root.height/3
                highlightRangeMode: ListView.StrictlyEnforceRange
                highlight: Item{
                    height: root.height/3
                    width: parent.width
                    Rectangle{
                        color: delimitersColor
                        width: parent.width
                        height: parent.height/20
                        anchors.top: parent.top
                    }
                    Rectangle{
                        color: delimitersColor
                        width: parent.width
                        height: parent.height/20
                        anchors.bottom: parent.bottom
                    }
                }
            }
            color: listsBackground
        }

    }
}
