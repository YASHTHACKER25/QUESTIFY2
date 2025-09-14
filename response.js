import mongoose from "mongoose";

const ResponseSchema= new mongoose.Schema(
    {
        helpful:{
            type:Number,default:0
        },
        notHelpful:{
            type:Number,default:0
        },
        Content:{
            type:String,
            required:true
        },
        User:{
            type:mongoose.Schema.Types.ObjectId,ref:"User",
            required:true
        }
    },{timestamps:true}
);
export default mongoose.model("Response",ResponseSchema);
