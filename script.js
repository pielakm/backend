// const express = require('express');
// const { PrismaClient } = require('@prisma/client');

// const prisma = new PrismaClient();
// const app = express();

// app.use(express.json());

// async function main(){
// app.post('/signup', async (req, res) => {
//   const {
//     name, second_name, surname, FK_iduser_type, email, phonenumber,
//     zipcode, street, FK_idcity, password, posts // Extract posts from req.body
//   } = req.body;
  
//   // Ensure posts are properly mapped or an empty array is passed
//   const postData = posts && posts.length > 0
//     ? posts.map((post) => ({
//         name: post.name,
//         surname: post.surname || undefined
//       }))
//     : [];

//   try {
//     // Create user with related posts
//     const result = await prisma.user.create({
//       data: {
//         name,
//         second_name,
//         surname,
//         FK_iduser_type,
//         email,
//         phonenumber,
//         zipcode,
//         street,
//         FK_idcity,
//         password,
//         posts: {
//           create: postData, // Create posts if there are any
//         },
//       },
//     });
    
//     // Send back result in response
//     res.json(result);
//   } catch (error) {
//     console.error(error);
//     res.status(500).json({ error: "An error occurred during signup." });
//   }
// });
// }
// main()
//   .then(async () => {
//     await prisma.$disconnect()
//   })
//   .catch(async (e) => {
//     console.error(e)
//     await prisma.$disconnect()
//     process.exit(1)
//   })


// const port = 5000
// app.listen(port, function() {
//   console.log(`Server is up and running on ${port}`)
// })

