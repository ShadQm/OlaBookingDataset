--ALTER TABLE "Bookings"
--RENAME COLUMN "Canceled_Rides_by_Driver" TO "Cancelled_Rides_By_Driver";

--1. Retrieve all successful bookings:
Select * From "Bookings"
Where "Booking_Status" = 'Success';

--2. Find the average ride distance for each vehicle type:
SELECT "Vehicle_Type", ROUND(AVG("Ride_Distance"),2) as "Average_Ride_Distance" FROM "Bookings"
GROUP BY "Vehicle_Type"

--3. Get the total number of cancelled rides by customers:
SELECT Count("Cancelled_Rides_By_Customer") as "Total_Cancelled_By_Customers"
FROM "Bookings"
Where "Cancelled_Rides_By_Customer" <> 'Not Cancelled'

--4. List the top 5 customers who booked the highest number of rides:
SELECT "Customer_ID", Count(*)  as "Booking_Count" FROM "Bookings"
GROUP BY "Customer_ID"
ORDER BY "Booking_Count" DESC
LIMIT 5

--5. Get the number of rides cancelled by drivers due to personal and car-related issues:
SELECT COUNT(*) as "Car_personal_Issue_Cancellation" FROM "Bookings"
WHERE "Cancelled_Rides_By_Driver" = 'Personal & Car related issue'

--6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
SELECT MAX("Driver_Ratings") as Max_Driver_Rating, 
MIN("Driver_Ratings") as Min_Driver_Rating
FROM "Bookings"
WHERE "Vehicle_Type"= 'Prime Sedan'

--7. Retrieve all rides where payment was made using UPI:
SELECT Count(*) as "Total_UPI_Payments" FROM "Bookings"
WHERE "Payment_Method" = 'UPI'

--8. Find the average customer rating per vehicle type:
SELECT "Vehicle_Type", Round(AVG("Customer_Rating"),2) as "Average_Customer_Rating"
FROM "Bookings"
GROUP BY "Vehicle_Type"
ORDER BY "Average_Customer_Rating" DESC

--9. Calculate the total booking value of rides completed successfully:
SELECT SUM("Booking_Value") as "Total_Rides_Value"
FROM "Bookings"
WHERE "Booking_Status" = 'Success'

--10. List all incomplete rides along with the reason:
SELECT "Booking_ID","Incomplete_Rides_Reason" FROM "Bookings"
WHERE "Incomplete_Rides" = 'Yes'
