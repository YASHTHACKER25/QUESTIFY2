import mongoose from "mongoose";

const UserSchema=new mongoose.Schema(
    {
        Username:{
            type:String,
            required:true,
            unique:true,
            trim:true,
            lowercase:true,
        },
        Password:{
            type:String,
            required:true,
        },
        Favoritesubjects:{
            type:[String],//array of strings
            default:[],
        },
        State:{
            type:String,
            required:true,
        },
        refreshToken:{
            type:String,
            default:null,
        },
    },
    {timestamps:true}
);

export default mongoose.model("User",UserSchema);-