const express = require('express');
const bcrypt = require('bcryptjs');
const authRouter = express.Router();
const User = require('../models/user');
const auth = require('../middleware/auth');
const jwt = require('jsonwebtoken');
    
    

authRouter.post("/api/signup",async (req,res)=>{
    //get data from user
   const {name , email , password }=req.body//body to post it

   const exisitngUser=await User.findOne({email});// finding email property in User it is a promise checking for existing user
   
   // password encrypter 
   const hashedPassword = await bcrypt.hash(password,8);
  




   //_v and id is provided like id is for identification for each different user, _v is telling the v how many time we have edited it
    //post data to db - connection to db mongoose
    try{
        if(exisitngUser){
            return res.status(400).json({msg:"User is already registered"});
            // we use return as furhter the code is not executed
           }
           //we specify 400 as it will pass 200 as response will be succesfull we are looking for already exisitng email 
        
           let user =new User({// creating model objec
            name,
            email,
            password : hashedPassword,
            //order doesn't matter what is required we specify it             
           });
           //post data to db
           
           user = await user.save();//MODEL saved
           //return data to user
           res.json(user);
           
        
    }
    catch(e){
        res.status(500).json({error:e.message})
    }
});

//signIn route

authRouter.post("/api/signin" , async(req,res)=>{
    try{
        const{email, password}=req.body;

        const user = await User.findOne({email});
        //if user is found returns the user data else return null
            if(!user) {
                return res.status(400)
                .json({msg:"User with this email does not exist"});
            }
        // testing pw
        const isMatch =await bcrypt.compare(password,user.password)   
        if(!isMatch){
            return res.status(400)
            .json({msg:"Incorrect Password"})
        }

        //jwt
        const token = jwt.sign({id:user._id}, "passwordKey");
        res.json({token, ...user._doc}); // ... gives us email, name seperately
    }
    catch(e){
        res.status(500).json({error:e.message});
    }
});


// token passing as header and  validation
authRouter.post("/tokenIsValid",async(req,res)=>{
try{
    //passing in a header
const token = req.header('x-auth-token');
if(!token)return res.json(false);
const isVerified = jwt.verify(token,'passwordKey');
if(!isVerified) return res.json(false);

const user = await User.findById(isVerified.id);
if(!user) return res.json(false);

res.json(true);

}
catch(e){

}
});


// getting user data 
authRouter.get('/', auth,async(req,res)=>{
    const user = await User.findById(req.user);
    res.json({...user._doc,token:req.token})
});

module.exports=authRouter;