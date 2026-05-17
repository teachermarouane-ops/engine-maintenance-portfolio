-- ============================================
-- Smart Engine Maintenance System
-- SQL Queries for Fleet Analysis
-- Author: teachermarouane-ops
-- ============================================

-- 1. View all engines and their current status
SELECT engine_id, category, Status, Days_Since_Maintenance, Hours_Used
FROM engines_clean
ORDER BY Status, Days_Since_Maintenance DESC;

-- 2. Count engines by status
SELECT Status, COUNT(*) as Total_Engines
FROM engines_clean
GROUP BY Status
ORDER BY Total_Engines DESC;

-- 3. Engines that need immediate maintenance
SELECT engine_id, category, Days_Since_Maintenance, Hours_Used, Maintenance_Type
FROM engines_clean
WHERE Status = 'Maintenance Due'
ORDER BY Days_Since_Maintenance DESC;

-- 4. Engines coming up for maintenance soon
SELECT engine_id, category, Days_Since_Maintenance, Hours_Used
FROM engines_clean
WHERE Status = 'Soon'
ORDER BY Days_Since_Maintenance DESC;

-- 5. Average hours used by category
SELECT category, 
       ROUND(AVG(Hours_Used), 2) as Avg_Hours_Used,
       COUNT(*) as Total_Engines
FROM engines_clean
GROUP BY category
ORDER BY Avg_Hours_Used DESC;

-- 6. Fleet health summary
SELECT 
    COUNT(*) as Total_Fleet,
    SUM(CASE WHEN Status = 'OK' THEN 1 ELSE 0 END) as OK,
    SUM(CASE WHEN Status = 'Soon' THEN 1 ELSE 0 END) as Soon,
    SUM(CASE WHEN Status = 'Maintenance Due' THEN 1 ELSE 0 END) as Overdue
FROM engines_clean;

-- 7. Engines by maintenance type
SELECT Maintenance_Type, COUNT(*) as Total,
       ROUND(AVG(Hours_Used), 2) as Avg_Hours
FROM engines_clean
GROUP BY Maintenance_Type;

-- 8. Most critical engines (overdue + high hours)
SELECT engine_id, category, Hours_Used, 
       Days_Since_Maintenance, Maintenance_Type
FROM engines_clean
WHERE Status = 'Maintenance Due'
ORDER BY Hours_Used DESC;

-- 9. Category risk analysis
SELECT category,
       COUNT(*) as Total,
       SUM(CASE WHEN Status = 'Maintenance Due' THEN 1 ELSE 0 END) as Overdue,
       SUM(CASE WHEN Status = 'Soon' THEN 1 ELSE 0 END) as Soon
FROM engines_clean
GROUP BY category
ORDER BY Overdue DESC;

-- 10. Engines with highest usag
