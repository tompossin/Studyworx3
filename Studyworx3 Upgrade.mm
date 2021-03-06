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
<node TEXT="Work on the &quot;split&quot; error when rendering charts." ID="ID_494858870" CREATED="1436707184645" MODIFIED="1436879148670">
<icon BUILTIN="100%"/>
<icon BUILTIN="button_ok"/>
<richcontent TYPE="NOTE">

<html>
  <head>
    
  </head>
  <body>
    <p>
      I think this is caused by null values in ppoints.
    </p>
    <p>
      
    </p>
    <p>
      I need to try .blank? as a test it might be the answer.
    </p>
    <p>
      
    </p>
    <p>
      Turns out this error happens when people abandon ppoint records without doing anything to them.
    </p>
    <p>
      
    </p>
    <p>
      <i><b>I may want to look into the controller, specifically the new or create methods and see what is being saved on the initial creation so that if someone abandons a record the record is in a more complete state.</b></i>
    </p>
  </body>
</html>
</richcontent>
<node TEXT="ToDo" ID="ID_286321716" CREATED="1436879444993" MODIFIED="1436879506452"><richcontent TYPE="NOTE">

<html>
  <head>
    
  </head>
  <body>
    <p>
      <i><b>May want to look at the new and create methods in the controller to see if the initial creation could create a more complete record without messing up anything else.</b></i>
    </p>
    <p>
      
    </p>
  </body>
</html>
</richcontent>
</node>
</node>
<node TEXT="Fix PDF Views for Charts, Docs, and assignments" ID="ID_981116393" CREATED="1436209141188" MODIFIED="1436991529670">
<node TEXT="Done" ID="ID_381859316" CREATED="1436620153144" MODIFIED="1436991509802"><richcontent TYPE="NOTE">

<html>
  <head>
    
  </head>
  <body>
    <ul>
      <li>
        Got rid of every option except for print on the assignment page. Too many issues with pandoc and the whole document creation process.
      </li>
    </ul>
  </body>
</html>
</richcontent>
</node>
<node TEXT="ToDo" ID="ID_1258899528" CREATED="1436620155971" MODIFIED="1436991460655"/>
<node TEXT="Fix the inefficient queries in the charting process" ID="ID_1247945185" CREATED="1436209257909" MODIFIED="1436451098557">
<icon BUILTIN="button_ok"/>
<icon BUILTIN="ksmiletris"/>
<icon BUILTIN="100%"/>
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
<node TEXT="Debug the math in grade averages &amp; reports" ID="ID_125750655" CREATED="1436209193075" MODIFIED="1436209256500">
<node TEXT="Done" ID="ID_777315662" CREATED="1436620225569" MODIFIED="1436620227272"/>
<node TEXT="ToDo" ID="ID_1854175238" CREATED="1436620227988" MODIFIED="1436620260425"><richcontent TYPE="NOTE">

<html>
  <head>
    
  </head>
  <body>
    <ul>
      <li>
        I need to see if the current math is right.
      </li>
      <li>
        I need more reports.
      </li>
    </ul>
  </body>
</html>
</richcontent>
</node>
</node>
<node TEXT="Give useful messages for past due assignments." ID="ID_626974536" CREATED="1436804572510" MODIFIED="1436804652411"><richcontent TYPE="NOTE">

<html>
  <head>
    
  </head>
  <body>
    <p>
      I think it is confusing when people get the grading view and not the editing view under certain circumstances.
    </p>
    <p>
      
    </p>
  </body>
</html>
</richcontent>
</node>
<node TEXT="Fix the errors with a missing image" ID="ID_1159191923" CREATED="1436449816107" MODIFIED="1438900630600">
<icon BUILTIN="help"/>
<richcontent TYPE="NOTE">

<html>
  <head>
    
  </head>
  <body>
    <p>
      This is mostly caused by Mac nerds. I guess Mac automatically request that apple-touch.png image every time they hit the site.
    </p>
    <p>
      
    </p>
    <p>
      Dumb.
    </p>
  </body>
</html>
</richcontent>
<arrowlink SHAPE="CUBIC_CURVE" COLOR="#000000" WIDTH="2" TRANSPARENCY="80" FONT_SIZE="9" FONT_FAMILY="SansSerif" DESTINATION="ID_1464691866" STARTINCLINATION="210;0;" ENDINCLINATION="210;0;" STARTARROW="NONE" ENDARROW="DEFAULT"/>
</node>
</node>
<node TEXT="Feature upgrades" POSITION="right" ID="ID_1262380660" CREATED="1436209086507" MODIFIED="1436209466240" VSHIFT="40">
<edge COLOR="#0000ff"/>
<node TEXT="Look at drop vs delete for personnel may need to add delete (or move)" ID="ID_367257797" CREATED="1436209305134" MODIFIED="1436994175503">
<node TEXT="Done" ID="ID_1527924779" CREATED="1436451118065" MODIFIED="1436994243318">
<icon BUILTIN="button_ok"/>
<icon BUILTIN="100%"/>
<richcontent TYPE="NOTE">

<html>
  <head>
    
  </head>
  <body>
    <ul>
      <li>
        Look at relationships between User and Participant
      </li>
      <li>
        Write code for deleting the participant.
      </li>
      <li>
        Participant can be deleted without losing any work. If it is deleted and has work in the school all that needs to happen is that they need to re-register.
      </li>
    </ul>
  </body>
</html>
</richcontent>
</node>
<node TEXT="ToDo" ID="ID_1609205363" CREATED="1436451120773" MODIFIED="1436566032293"/>
</node>
<node TEXT="Convert the image generator to HTML canvas" ID="ID_634556502" CREATED="1436209339059" MODIFIED="1436209363632"/>
<node TEXT="Improve profile views." ID="ID_1464691866" CREATED="1436209405399" MODIFIED="1436209414635">
<node TEXT="Done" ID="ID_1208142290" CREATED="1436619815526" MODIFIED="1436619818776"/>
<node TEXT="ToDo" ID="ID_234790925" CREATED="1436619819675" MODIFIED="1438900525336"><richcontent TYPE="NOTE">

<html>
  <head>
    
  </head>
  <body>
    <ul>
      <li>
        Audit use case. Right now people don't find any of this useful or fun.
      </li>
      <li>
        Get rid of the errors caused by apple rigs looking for an icon that is not there.
      </li>
    </ul>
  </body>
</html>
</richcontent>
</node>
</node>
<node TEXT="Improve email lookups, and mass mailing announcements etc." ID="ID_1836840529" CREATED="1436362465040" MODIFIED="1436362493264">
<node TEXT="Done" ID="ID_461626380" CREATED="1436450621268" MODIFIED="1436566101628">
<icon BUILTIN="25%"/>
<richcontent TYPE="NOTE">

<html>
  <head>
    
  </head>
  <body>
    <ul>
      <li>
        I put email addresses in the school admin table to make it easier to contact school leaders.
      </li>
    </ul>
  </body>
</html>
</richcontent>
</node>
<node TEXT="ToDo" ID="ID_316896251" CREATED="1436450624675" MODIFIED="1436450801856"><richcontent TYPE="NOTE">

<html>
  <head>
    
  </head>
  <body>
    <p>
      Next Up: Create an Admin_Messages Mailer (Name is debateable) to handle contacting me via email and mass-mailing all school leaders or possibly all school leaders and school admins.
    </p>
    <p>
      
    </p>
    <p>
      Also create a searchable email/message directory available to ?? not sure how widely to open this up.
    </p>
  </body>
</html>
</richcontent>
</node>
</node>
<node TEXT="Build a complete school with assignments for private schools" ID="ID_578353542" CREATED="1436804542298" MODIFIED="1436881454880">
<icon BUILTIN="75%"/>
<richcontent TYPE="NOTE">

<html>
  <head>
    
  </head>
  <body>
    <p>
      I want people to have a complete school to play with as soon as they log in.
    </p>
    <p>
      This will also go a long way toward helping them set up a proper school on their first time out.
    </p>
    <p>
      
    </p>
    <p>
      Finished this, it took a lot of debugging and there are no templates or anything.
    </p>
    <p>
      
    </p>
    <p>
      But it is better than what there was before.
    </p>
    <p>
      
    </p>
    <p>
      <i><b>I should look at seeding the observation table with at least a few observations.</b></i>
    </p>
    <p>
      
    </p>
  </body>
</html>
</richcontent>
<node TEXT="Done" ID="ID_1426441644" CREATED="1436994282268" MODIFIED="1436994378216">
<icon BUILTIN="50%"/>
<richcontent TYPE="NOTE">

<html>
  <head>
    
  </head>
  <body>
    <ul>
      <li>
        Set up a complete school (mostly when a new user is created.
      </li>
    </ul>
  </body>
</html>
</richcontent>
</node>
<node TEXT="ToDo" ID="ID_1482203467" CREATED="1436879334633" MODIFIED="1436994390523"><richcontent TYPE="NOTE">

<html>
  <head>
    
  </head>
  <body>
    <p>
      <i><b>Look at seeding some observations to start with so people can jump right in if they want.</b></i>
    </p>
    <p>
      
    </p>
    <p>
      
    </p>
  </body>
</html>
</richcontent>
</node>
</node>
</node>
<node TEXT="Review and update" POSITION="right" ID="ID_1054138370" CREATED="1436368559250" MODIFIED="1436449407461" VSHIFT="20">
<edge COLOR="#00ffff"/>
<node TEXT="School Admin" ID="ID_1513478378" CREATED="1436368572327" MODIFIED="1436368578049">
<node TEXT="Workflow Audit" ID="ID_1264907118" CREATED="1436368601314" MODIFIED="1436368608026"/>
</node>
<node TEXT="Assignment Admin" ID="ID_1567385989" CREATED="1436368578977" MODIFIED="1436368584396">
<node TEXT="Done" ID="ID_1257780615" CREATED="1439249240395" MODIFIED="1439249290060"><richcontent TYPE="NOTE">

<html>
  <head>
    
  </head>
  <body>
    <p>
      I made the assignment and task delete feature to only work when there are no accepted students.
    </p>
    <p>
      After that you can only rename.
    </p>
    <p>
      
    </p>
  </body>
</html>

</richcontent>
</node>
<node TEXT="ToDo" ID="ID_1859082403" CREATED="1439249290041" MODIFIED="1439249293021"/>
</node>
</node>
<node TEXT="Log" POSITION="right" ID="ID_1187587147" CREATED="1436388400712" MODIFIED="1436449412834" HGAP="10" VSHIFT="20">
<edge COLOR="#ffff00"/>
<node TEXT="Helps related" ID="ID_635669454" CREATED="1436388413418" MODIFIED="1436449950524">
<node TEXT="Done" ID="ID_586754946" CREATED="1436449931608" MODIFIED="1436478634733">
<icon BUILTIN="50%"/>
<richcontent TYPE="NOTE">

<html>
  <head>
    
  </head>
  <body>
    <ul>
      <li>
        7.8.15 - Wrote a better intro to setting up a school in the blog and linked to it on the main admin page.
      </li>
    </ul>
  </body>
</html>
</richcontent>
</node>
<node TEXT="ToDo" ID="ID_1158308915" CREATED="1436449934343" MODIFIED="1436450009802"><richcontent TYPE="NOTE">

<html>
  <head>
    
  </head>
  <body>
    <ul>
      <li>
        Still need to look at auto-loading help for major admin operations.
      </li>
    </ul>
  </body>
</html>
</richcontent>
</node>
</node>
<node TEXT="General clean-up" ID="ID_459604434" CREATED="1436388497744" MODIFIED="1436450040696">
<node TEXT="Done" ID="ID_283380766" CREATED="1436450023555" MODIFIED="1437683314408"><richcontent TYPE="NOTE">

<html>
  <head>
    
  </head>
  <body>
    <ul>
      <li>
        7.8.15 - Cleaned up some extraneous junk in the editor of the various admin pages.
      </li>
      <li>
        Took the delete links out of the Assignment Admin pages. It was causing trouble when people would delete an assignment that had already been used in some way.
      </li>
    </ul>
  </body>
</html>
</richcontent>
</node>
<node TEXT="ToDo" ID="ID_1108212109" CREATED="1436450026481" MODIFIED="1436450028426"/>
</node>
<node TEXT="Print related" ID="ID_1322040496" CREATED="1436881306858" MODIFIED="1436881313595">
<node TEXT="Done" ID="ID_1754835912" CREATED="1436881314881" MODIFIED="1437683474109">
<icon BUILTIN="50%"/>
<richcontent TYPE="NOTE">

<html>
  <head>
    
  </head>
  <body>
    <ul>
      <li>
        Fixed the errors (most I guess) generated by bad ppoint records.
      </li>
      <li>
        Removed the Doc and PDF choices from the assignment task list. They were just too twitchy.
      </li>
    </ul>
  </body>
</html>
</richcontent>
</node>
<node TEXT="ToDo" ID="ID_364740642" CREATED="1436881319608" MODIFIED="1437683488393"/>
</node>
<node TEXT="Orders related" ID="ID_762530602" CREATED="1436393460743" MODIFIED="1436393736920">
<node TEXT="Done" ID="ID_1101262223" CREATED="1436393736910" MODIFIED="1438356196056">
<icon BUILTIN="75%"/>
<richcontent TYPE="NOTE">

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
        [done]Need a way to show that an order is pending for the one that placed the order.
      </li>
      <li>
        Added a delete link to the index page for orders.
      </li>
      <li>
        Fixed the redirect after delete
      </li>
      <li>
        School order must be approved before a school can be created. This will eliminate a lot of extra school shinanigans.
      </li>
      <li>
        Fixed New school links to be more obvious and easier to use.
      </li>
      <li>
        Added notification emails to both the customer and the superadmin when an order is made.
      </li>
      <li>
        Fixed a bug that was causing the desired clone school to be nulled out when the school was approved. (very awkward)
      </li>
    </ul>
  </body>
</html>
</richcontent>
</node>
<node TEXT="ToDo" ID="ID_347116273" CREATED="1436393740206" MODIFIED="1436550277000"><richcontent TYPE="NOTE">

<html>
  <head>
    
  </head>
  <body>
    <ul>
      <li>
        Make owners name into a link to message in the orders index page.
      </li>
    </ul>
  </body>
</html>
</richcontent>
</node>
</node>
<node TEXT="Registrations" ID="ID_122918252" CREATED="1436396981397" MODIFIED="1436396984990">
<node TEXT="Done" ID="ID_560103812" CREATED="1436396985540" MODIFIED="1436991359776"><richcontent TYPE="NOTE">

<html>
  <head>
    
  </head>
  <body>
    <ul>
      <li>
        Added Delete links to two registration forms.
      </li>
      <li>
        Tested and pushed it up to the server.
      </li>
      <li>
        Added an email notification to the registration process. Now the applicant and all the school admins will get an email when someone registers for the school.
      </li>
    </ul>
  </body>
</html>
</richcontent>
</node>
<node TEXT="ToDo" ID="ID_892196501" CREATED="1436396988429" MODIFIED="1437409748886">
<icon BUILTIN="yes"/>
<richcontent TYPE="NOTE">

<html>
  <head>
    
  </head>
  <body>
    <ul>
      <li>
        I need to send an email when a person is accpeted as well.
      </li>
    </ul>
  </body>
</html>
</richcontent>
</node>
</node>
<node TEXT="Documents" ID="ID_1855074069" CREATED="1436991279361" MODIFIED="1436991283894">
<node TEXT="Done" ID="ID_197912035" CREATED="1436991284918" MODIFIED="1436991341640"><richcontent TYPE="NOTE">

<html>
  <head>
    
  </head>
  <body>
    <ul>
      <li>
        Fixed the related documents and the all documents viewer in the assignments section.
      </li>
    </ul>
  </body>
</html>
</richcontent>
</node>
<node TEXT="ToDo" ID="ID_1366703877" CREATED="1436991290245" MODIFIED="1436991293510"/>
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
<node TEXT="Ideas for Studyworx 4" POSITION="left" ID="ID_1495767352" CREATED="1436209114400" MODIFIED="1436881280596" VSHIFT="20">
<edge COLOR="#ff00ff"/>
<cloud COLOR="#f0f0f0" SHAPE="ARC"/>
<node TEXT="Look again at the current state of WYSIWYG" ID="ID_1381314725" CREATED="1436620382612" MODIFIED="1436620406504"/>
<node TEXT="Needs to be Mobile from the start" ID="ID_309835838" CREATED="1436620413203" MODIFIED="1436620424810"/>
<node TEXT="Needs to be multi-lingual from the start" ID="ID_705092133" CREATED="1436620426485" MODIFIED="1436620440979"/>
<node TEXT="Include the full biblical text" ID="ID_530714646" CREATED="1437413614973" MODIFIED="1437413628126">
<node TEXT="Ideally with the ability to mark it up" ID="ID_663628186" CREATED="1437413629389" MODIFIED="1437413643259"/>
</node>
</node>
</node>
</map>
