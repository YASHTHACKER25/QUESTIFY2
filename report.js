import mongoose from "mongoose";

const reportSchema=new mongoose.Schema(
    {
        Content:{
            type:String,
            required:true
        },
        User:{
            type:mongoose.Schema.Types.ObjectId,ref:"User",
            required:true
        },
        Question:{
            type:mongoose.Schema.Types.ObjectId,ref:"Question"
        },
        Answer:{
            type:mongoose.Schema.Types.ObjectId,ref:"Answer"
        },
        Status:{
            type:String,
    
        }
    }, {timestamps:true}
);