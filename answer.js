import mongoose from "mongoose";

cosnt AnswerSchema=new mongoose.Schema(
    {
        Question:{
            type:mongoose.Schema.Types.ObjectId,ref:"Question",
            required:true
        },
        Content:{
            type:String,
            required:true
        },
        Responses:[{
            type:mongoose.Scheme.Types.ObjectId,ref:"Response"
        }],
        User:{
            type:mongoose.Schema.Types.ObjectId,ref:"User",
            required:true
        },
        
    },{timestamps:true}
);
export default mongoose.model("Answer",answerSchema);
