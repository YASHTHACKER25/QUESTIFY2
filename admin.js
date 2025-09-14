import mongoose from "mongoose";

const AdminSchema=new mongoose.Schema(
    {
        sername:{
            type:String,
            required:true,
            unique:true
        },
        
    }
)
