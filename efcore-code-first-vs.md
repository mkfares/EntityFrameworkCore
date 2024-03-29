In this tutorial, you will create a console application using Visual Studio on Windows, then link it to a database using Entity Framework Core. Finally, you will perform CRUD operations on the database.

## Requirements

1. Visual Studio 16.3+

    To check the version of the installed Visual Studio go to: **Help > About Visual Studio**

2. .NET Core SDK 3.0+

    To check the .NET Code SDK, open the command or the powershell and type: 
    
    ```PowerShell
    $ dotnet --version
    ```

## Install .NET Core SDK

1. [Downaload the package by clicking on Download .NET Core SDK](https://dotnet.microsoft.com/download)

2. Install the .NET Core SDK package on your computer

## Create Console Project

1. Open Visual Studio and create a Console Project using the Console App (.NET Core) template

2. Provide a name for your project (e.g., ConsoleApp)

3. Build and run your project using **Debug > Start Without Debugging** (Ctrl+F5)

## Add Entity Framework Core to the Project

1. Select **Tools > NuGet Package Manager > Package Manager Console** (Ctrl+Q then type console)

2. Install the SQL Server provider package in the Package Manager Console (PMC) window 

    ```PowerShell
    PM> Install-Package Microsoft.EntityFrameworkCore.SqlServer
    ```
    For ASP.NET Core apps, this package is included automatically.

3. Add the Package Manager Console tools to the project by installing the following package

    ```PowerShell
    PM> Install-Package Microsoft.EntityFrameworkCore.Tools
    ```
    For ASP.NET Core apps, this package is included automatically.

4. Check that the packages are available under **Dependencies > Packages** in the Solution Explorer window

5. Build then run your project using **Debug > Start Without Debugging** (Ctrl+F5)

## Create Models (Entities) and Database Context

1. Add the following class to your project

    ```C#
    class Employee
    {
        public int EmployeeId { get; set; }
        
        public string Name { get; set; }
    }
    ```

2. Add to your project a class named CompanyContext which represents the database context

    ```C#
    using Microsoft.EntityFrameworkCore;
    ...

    class CompanyContext : DbContext
    {
        public DbSet<Employee> Employees { get; set; }
        
        protected override void OnConfiguring(DbContextOptionsBuilder options)
        {
            string connectionString = "Server=(localdb)\\MSSQLLocalDB;Database=CompanyDatabase;Trusted_Connection=True;";
            
            options.UseSqlServer(connectionString);
        }
    }
    ```
    
    Note: You need to add "usung Microsoft.EntityFrameworkCore" statement to make DbContext class available

3. Build your project to check for errors

## Create the Database

1. To create the database from your model and context, run the following commands in the Package Manager Console (PMC)

    ```PowerShell
    PM> Add-Migration Initial
    
    PM> Update-Database
    ```

2. Verify that the database **CompanyDatabase** is created under **SQL Server > (localdb)\MSSQLLocalDB > Databases** in the SQL Server Object Explorer window. You may need to refresh the **Databases** folder to see the new database.

## Perform CRUD Operations on the Database
    
1. Include the following code in the Main() method in the Program.cs file

    ```C#
    using System;
    using System.Linq;
    
    static void Main(string[] args)
    {
        using (var context = new CompanyContext())
        {
            // 1. Add (Insert) new employee into the database
            Console.WriteLine("Insert an employee");
            
            // No need to specify the Id, it will be generated by the database
            var employee1 = new Employee { Name = "Dan" };

            // Add employee to the context (not database)
            //context.Employees.Add(employee1);
            context.Add(employee1);

            // Insert employee into the database
            context.SaveChanges();

            // 2. Show (Select) employees from database
            // Converted to lists
            var employees = context.Employees.ToList();

            // Print employees from database
            foreach (var item in employees)
            {
                Console.WriteLine($"Id: {item.EmployeeId}, Name: {item.Name}");
            }

            // 3. Update the employee
            Console.WriteLine("Update an employee");
            
            // get the first employee
            var employee2 = context.Employees.FirstOrDefault();

            // Update the properties/attributes
            employee2.Name = "Tarik";

            // Save the changes to the database
            context.SaveChanges();

            // Print employees from database
            foreach (var item in context.Employees.ToList())
            {
                Console.WriteLine($"Id: {item.EmployeeId}, Name: {item.Name}");
            }

            // 4. Delete an employee from the database
            Console.WriteLine("Delete an employee");
            
            // Get the first employee
            var employee3 = context.Employees.FirstOrDefault();

            // Check whether the employee exisits in the database 
            if(employee3 != null)
            {
                //context.Employees.Remove(employee3);
                context.Remove(employee3);
                context.SaveChanges();
                Console.WriteLine("One employee deleted");
            }
            else
            {
                Console.WriteLine("Nothing to delete");
            }

            // Print employees from database
            foreach (var item in context.Employees.ToList())
            {
                Console.WriteLine($"Id: {item.EmployeeId}, Name: {item.Name}");
            }
        }
    }
    ```

2. Buid then run the application, check the output of the application

3. To check the content of the database, you may run the application in debugging mode (F5) and use breakpoints
