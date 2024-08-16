Version 2.1 Author Oliver Farthing

Prerequisites
Root Folder: Ensure that the root folder is located at C:\gamsync.
GAM Advanced: A functional version of "GAM Advanced" must be installed in the directory C:\gamadv-xtd3.#

Components (Essential files for this service)
gamsync_mastersync.BAT: Initiates a new synchronisation process.
mastergamsync.csv: Contains the primary database of all "user" objects retrieved from "GAM Advanced".
gamsync_maintenance.BAT: Executes maintenance tasks to consolidate all actions performed by this tool.
*sync.csv: Files matching this pattern are processed by gamsync_export.BAT. These files include the results of synchronisation operations.
*syncvalidation.csv: Files with this pattern are used to validate the current state of objects. They are pulled into arrays for validation purposes.
gamsync_*query.ps1: Processes data from mastergamsync.csv and determines the contents of *sync.csv.
gamsync_export.BAT: Processes data from the addition and subtraction databases and sends them to the GAM Advanced to send the updates to google.

Changes
31/07/24 - Version 2.1
NXTS query added, new query which has updated framework. Improveing response times.

30/07/24 - Version 2.0
Redesigned the script to handle each query independently, allowing each query to manage its own validator arrays separately. This adjustment supports the "activemailbox" function, which operates independently of any domain-specific logic. Additionally, i have moved the exporting functionality to a separate batch file (mastersync.bat). This change separates data processing from data exporting, improving the modularity and maintainability of the script. Each query now handles its own data processing, and the mastersync.bat file takes care of exporting the results. This separation ensures better flexibility and organization in the script’s operation.



20/07/24 - Version 1.5
Enhanced logging functionality to clean log directory when logs are older than 3 months.

19/07/24 - Version 1.4
Enhanced logging functionality to include exports for each run. Added exit codes and message boxes to confirm errors at different stages and to indicate when the sync was successful.

19/07/24 - Version 1.3
Enhanced functionality to validationdatabase function by identifying and handling users that do not meet the query criteria. Implemented automated processes for user removal, ensuring more accurate and efficient data management.

18/07/24 - Version 1.2
Upgraded the system to use arrays instead of csv tables for more efficient querying and improved performance. Introduced new functionality to selectively ignore certain headers in the master database array, optimizing the query process.

17/07/24 - Version 1.1
Integrated validationdatabase function to streamline and flatten queries sent to (GAM). Implemented automation features to enhance service operations and reduce manual intervention.

17/07/24 - Version 1.0
Established initial functionality for integrating and managing user accounts from a masterdatabase into groups with (GAM). Laid the foundation for user and group management automation.
