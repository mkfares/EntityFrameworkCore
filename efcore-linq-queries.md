This tutorial allows you to link an existing Product Database to a console application, then perform LINQ queries on the database.

## Create Console Project

1. Open Visual Studio and create a Console Project using the Console App (.NET Core) template

2. Provide a name for your project (e.g., LinqTutorialApp)

3. Build and run your project using **Debug > Start Without Debugging** (Ctrl+F5)

## Add Entity Framework Core to the Project

1. Select **Tools > NuGet Package Manager > Package Manager Console** (Ctrl+Q then type console)

2. In the Package Manager Console (PMC) window, install the SQL Server provider package

    ```PowerShell
    PM> Install-Package Microsoft.EntityFrameworkCore.SqlServer
    ```

3. To add the PMC tools to the project, install the following package

    ```PowerShell
    PM> Install-Package Microsoft.EntityFrameworkCore.Tools
    ```
    
4. Build then run your project using **Debug > Start Without Debugging** (Ctrl+F5)

## Create the Database on LocalDB instance

1. Open the **SQL Server Object Explorer** window from the view menu in Visual Studio, then expand the SQL Server, then select the **(localdb)\MSSQLLocalDB** instance. Click on **New Query** icon on the top of the SQL Server Object Explorer window, A new query editor window will open.

2. Paste the content of the file [ProductDatabase.sql](ProductDatabase.sql) in the Query Editor window

3. Click on the green arrow on the top left of the Query Editor window or press Ctrl+Shift+E to execute the SQL code.

4. The ProductDatabase database should be created. If the database does not show up, right-click on the Databases folder in SQL Server Object Explorer window then select refresh.

## Create Model and Context from Existing Database

1. Open the Package Manager Console (PMC) from Tools > NuGet Package Manager > Package Manager Console

2. Run the following command to generate the data model
    
    ```PowerShell
    PM> Scaffold-DbContext "Server=(localdb)\MSSQLLocalDB;Database=ProductDatabase;Integrated Security=True" Microsoft.EntityFrameworkCore.SqlServer -Context ProductDbContext -Force
    ```
    
3. Inspect the Product, Category, and ProductDbContext classes

4. To test that the app is linked to the database, add the following code to the Main() method.

    ```C#  
    using (var db = new ProductDbContext())
    {
        foreach (var item in db.Product)
        {
            Console.WriteLine(item.ProductId);
        }
    }
    ```
    
5. Build and run the project

