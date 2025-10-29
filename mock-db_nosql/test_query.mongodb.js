// use("sample_mflix")

// db.movies.aggregate([
// 	{$match: {directors:"Christopher Nolan"}},
// 	{$sort: {year: -1}},
// 	{$limit: 5},
// 	{$project: {_id: 0, title: 1, year: 1}}
// ]);

// use("sample_mflix")

// db.movies.aggregate([
//   { $match: { year: { $gte: 2000, $lte: 2010 } } },
//   { $group: { _id: "$year", totalMovies: { $sum: 1 } } },
//   { $sort: { _id: 1 } }
// ])

// use("sample_mflix")
// db.movies.aggregate([
//   { $unwind: "$genres" },
//   { $sortByCount: "$genres" },   // groups + counts + sorts, all in one
//   { $limit: 10 }
// ])
// Task: Write a query to see a list of all employees working at Chrome & Burger.

use("chrome-burger-db");
// db.staff.find({});

// Task: Write a query to find all menu items that fall under the 'Burger' category.
// db.menu_items.find({
//     category:'Burger'
// })

// Task: Write a query to show all menu items, but list them from the most expensive to the least expensive.

// db.menu_items.find({}).sort({ price: -1})
//  db.menu_items.find({}).sort({price:1}).limit(3);
// 5.Write a query to find all the ingredients supplied by 'Patty''s Premium Meats'.

// db.suppliers.aggregate([
//     {
//         $match: { name: "Patty's Premium Meats" }
//     },
//     {
//         $lookup: {
//             from: "ingredients",
//             localField: "_id",
//             foreignField: "supplier_id",
//             as: "supplied_ingredients"
//         }
//     },
//     {
//         $unwind: "$supplied_ingredients"
//     },
//     {
//         $project: {
//             _id: 0,
//             ingredient_name: "$supplied_ingredients.name"
//         }
//     }
// ]);

// Question 6: See All Orders Processed by a Specific Staff Member


// First, find Jane's staff ID
// var jane = db.staff.findOne({first_name: "Jane", last_name: "Doe"});

// // Then, find all orders processed by her
// db.orders.find({ "staff.staff_id": jane._id });

