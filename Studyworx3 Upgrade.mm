<map version="freeplane 1.2.0">
<!--To view this file, download free mind mapping software Freeplane from http://freeplane.sourceforge.net -->
<node TEXT="Studyworx3 Upgrade" ID="ID_1723255651" CREATED="1283093380553" MODIFIED="1436209482174"><hook NAME="MapStyle">
    <properties show_note_icons="true"/>

<map_styles>
<stylenode LOCALIZED_TEXT="styles.root_node">
<stylenode LOCALIZED_TEXT="styles.predefined" POSITION="right">
<stylenode LOCALIZED_TEXT="default" MAX_WIDTH="600" COLOR="#000000" STYLE="as_parent">
<font NAME="SansSerif" SIZE="10" BOLD="false" ITALIC="false"/>
</stylenode>
<stylenode LOCALIZED_TEXT="defaultstyle.details"/>
<stylenode LOCALIZED_TEXT="defaultstyle.note"/>
<stylenode LOCALIZED_TEXT="defaultstyle.floating">
<edge STYLE="hide_edge"/>
<cloud COLOR="#f0f0f0" SHAPE="ROUND_RECT"/>
</stylenode>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.user-defined" POSITION="right">
<stylenode LOCALIZED_TEXT="styles.topic" COLOR="#18898b" STYLE="fork">
<font NAME="Liberation Sans" SIZE="10" BOLD="true"/>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.subtopic" COLOR="#cc3300" STYLE="fork">
<font NAME="Liberation Sans" SIZE="10" BOLD="true"/>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.subsubtopic" COLOR="#669900">
<font NAME="Liberation Sans" SIZE="10" BOLD="true"/>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.important">
<icon BUILTIN="yes"/>
</stylenode>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.AutomaticLayout" POSITION="right">
<stylenode LOCALIZED_TEXT="AutomaticLayout.level.root" COLOR="#000000">
<font SIZE="18"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,1" COLOR="#0033ff">
<font SIZE="16"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,2" COLOR="#00b439">
<font SIZE="14"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,3" COLOR="#990000">
<font SIZE="12"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,4" COLOR="#111111">
<font SIZE="10"/>
</stylenode>
</stylenode>
</stylenode>
</map_styles>
</hook>
<hook NAME="AutomaticEdgeColor" COUNTER="6"/>
<hook NAME="accessories/plugins/AutomaticLayout.properties" VALUE="ALL"/>
<node TEXT="Known Bugs" POSITION="right" ID="ID_629576244" CREATED="1436209064940" MODIFIED="1436209469752" VSHIFT="-20">
<edge COLOR="#ff0000"/>
<node TEXT="Fix PDF Views for Charts, Docs, and assignments" ID="ID_981116393" CREATED="1436209141188" MODIFIED="1436209190447"/>
<node TEXT="Debug the math in grade averages &amp; reports" ID="ID_125750655" CREATED="1436209193075" MODIFIED="1436209256500"/>
<node TEXT="Fix the inefficient queries in the charting process" ID="ID_1247945185" CREATED="1436209257909" MODIFIED="1436361286289">
<icon BUILTIN="button_ok"/>
<richcontent TYPE="NOTE">

<html>
  <head>
    
  </head>
  <body>
    <p>
      Added a new index on titles_id to the charttexts and ppoints tables. This seems to have sped up the loading of charts by 100 fold literally.
    </p>
    <p>
      
    </p>
    <p>
      I think dual column indexes may not be worth very much in Rails.
    </p>
  </body>
</html>
</richcontent>
</node>
</node>
<node TEXT="Feature upgrades" POSITION="right" ID="ID_1262380660" CREATED="1436209086507" MODIFIED="1436209466240" VSHIFT="40">
<edge COLOR="#0000ff"/>
<node TEXT="Look at drop vs delete for personnel may need to add delete (or move)" ID="ID_367257797" CREATED="1436209305134" MODIFIED="1436209694063"><richcontent TYPE="NOTE">

<html>
  <head>
    
  </head>
  <body>
    <p>
      We may want to look at the ability to reassign people that have applied to the wrong school.
    </p>
    <p>
      
    </p>
    <p>
      The delete feature may cover this as long as we can delete only the registration and nothing else about the user.
    </p>
    <p>
      
    </p>
  </body>
</html>
</richcontent>
</node>
<node TEXT="Convert the image generator to HTML canvas" ID="ID_634556502" CREATED="1436209339059" MODIFIED="1436209363632"/>
<node TEXT="Improve profile views." ID="ID_1464691866" CREATED="1436209405399" MODIFIED="1436209414635"/>
<node TEXT="Improve email lookups, and mass mailing announcements etc." ID="ID_1836840529" CREATED="1436362465040" MODIFIED="1436362493264"/>
</node>
<node TEXT="Review and update" POSITION="right" ID="ID_1054138370" CREATED="1436368559250" MODIFIED="1436368571028">
<edge COLOR="#00ffff"/>
<node TEXT="School Admin" ID="ID_1513478378" CREATED="1436368572327" MODIFIED="1436368578049">
<node TEXT="Workflow Audit" ID="ID_1264907118" CREATED="1436368601314" MODIFIED="1436368608026">
<node TEXT="I want to create a public school" ID="ID_990434506" CREATED="1436368612407" MODIFIED="1436368744723"><richcontent TYPE="NOTE">

<html>
  <head>
    
  </head>
  <body>
    <ol>
      <li>
        request the creation of a school from the school admin page. (not very intuitive)

        <ol>
          <li>
            Ideas

            <ol>
              <li>
                Put link in Navbar
              </li>
              <li>
                Put link in account drop down list
              </li>
            </ol>
          </li>
        </ol>
      </li>
    </ol>
  </body>
</html>
</richcontent>
</node>
</node>
</node>
<node TEXT="Assignment Admin" ID="ID_1567385989" CREATED="1436368578977" MODIFIED="1436368584396"/>
</node>
<node TEXT="Log" POSITION="right" ID="ID_1187587147" CREATED="1436388400712" MODIFIED="1436388404848">
<edge COLOR="#ffff00"/>
<node TEXT="Helps related" ID="ID_635669454" CREATED="1436388413418" MODIFIED="1436388494113"><richcontent TYPE="NOTE">

<html>
  <head>
    
  </head>
  <body>
    <p>
      7.8.15 - Wrote a better intro to setting up a school in the blog and linked to it on the main admin page.
    </p>
  </body>
</html>

</richcontent>
</node>
<node TEXT="General clean-up" ID="ID_459604434" CREATED="1436388497744" MODIFIED="1436388570731"><richcontent TYPE="NOTE">

<html>
  <head>
    
  </head>
  <body>
    <p>
      7.8.15 - Cleaned up some extraneous junk in the editor of the various admin pages.
    </p>
  </body>
</html>

</richcontent>
</node>
<node TEXT="Orders related" ID="ID_762530602" CREATED="1436393460743" MODIFIED="1436393736920">
<node TEXT="Done" ID="ID_1101262223" CREATED="1436393736910" MODIFIED="1436393753264"><richcontent TYPE="NOTE">

<html>
  <head>
    
  </head>
  <body>
    <ul>
      <li>
        Fixed the approved column in DB
      </li>
      <li>
        Fixed the check_registrations method
      </li>
      <li>
        
      </li>
    </ul>
  </body>
</html>

</richcontent>
</node>
<node TEXT="ToDo" ID="ID_347116273" CREATED="1436393740206" MODIFIED="1436393902648"><richcontent TYPE="NOTE">

<html>
  <head>
    
  </head>
  <body>
    <ul>
      <li>
        Need to do something with bogus applications.
      </li>
      <li>
        Need a way to show that an order is pending for the one that placed the order.
      </li>
      <li>
        Need to fire an email to me when someone makes an order.
      </li>
    </ul>
  </body>
</html>

</richcontent>
</node>
</node>
</node>
<node TEXT="Workflow upgrades" POSITION="left" ID="ID_116711063" CREATED="1436209107292" MODIFIED="1436209477717" VSHIFT="-30">
<edge COLOR="#00ff00"/>
<node TEXT="Put the PT list link in a better spot" ID="ID_1353408809" CREATED="1436209210353" MODIFIED="1436209222618"/>
<node TEXT="Add help link to Assignment Admin page" ID="ID_1287768828" CREATED="1436272882531" MODIFIED="1436273075854"><richcontent TYPE="NOTE">

<html>
  <head>
    
  </head>
  <body>
    <p>
      It might be best to have the help page open automatically when they arrive at this page so they can understand how to proceed without going to the help section or trying to remember.
    </p>
  </body>
</html>
</richcontent>
</node>
<node TEXT="Automatically open help when a new assignment is started" ID="ID_715347290" CREATED="1436272959762" MODIFIED="1436272974122"/>
<node TEXT="Need a by student by module reports in reports" ID="ID_741148506" CREATED="1436274809056" MODIFIED="1436274822798"/>
</node>
<node TEXT="Ideas for Studyworx 4" POSITION="left" ID="ID_1495767352" CREATED="1436209114400" MODIFIED="1436209482172" VSHIFT="20">
<edge COLOR="#ff00ff"/>
</node>
</node>
</map>
