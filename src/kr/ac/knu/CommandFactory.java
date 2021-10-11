package kr.ac.knu;

import java.util.HashMap;

import kr.ac.knu.boardcommand.BoardDeleteCommand;
import kr.ac.knu.boardcommand.BoardDetailCommand;
import kr.ac.knu.boardcommand.BoardInsertCommand;
import kr.ac.knu.boardcommand.BoardInsertFormCommand;
import kr.ac.knu.boardcommand.BoardListCommand;
import kr.ac.knu.boardcommand.BoardUpdateCommand;
import kr.ac.knu.boardcommand.BoardUpdateFormCommand;
import kr.ac.knu.boardcommand.CommentDeleteCommand;
import kr.ac.knu.boardcommand.CommentInsertCommand;
import kr.ac.knu.boardcommand.CommentReplyCommand;
import kr.ac.knu.boardcommand.CompleUpdateCommand;
import kr.ac.knu.boardcommand.HitUpdateCommand;
import kr.ac.knu.boardcommand.MemberBoardListCommand;
import kr.ac.knu.command.*;
import kr.ac.knu.qnacommand.FaqDeleteCommand;
import kr.ac.knu.qnacommand.FaqDetailCommand;
import kr.ac.knu.qnacommand.FaqInsertCommand;
import kr.ac.knu.qnacommand.FaqInsertFormCommand;
import kr.ac.knu.qnacommand.FaqListCommand;
import kr.ac.knu.qnacommand.FaqUpdateCommand;
import kr.ac.knu.qnacommand.FaqUpdateFormCommand;
import kr.ac.knu.qnacommand.QnaDeleteCommand;
import kr.ac.knu.qnacommand.QnaDetailCommand;
import kr.ac.knu.qnacommand.QnaInsertCommand;
import kr.ac.knu.qnacommand.QnaInsertFormCommand;
import kr.ac.knu.qnacommand.QnaListCommand;
import kr.ac.knu.qnacommand.QnaReplayCommand;
import kr.ac.knu.qnacommand.QnaReplayFormCommand;
import kr.ac.knu.qnacommand.QnaSecCommand;
import kr.ac.knu.qnacommand.QnaUpdateCommand;
import kr.ac.knu.qnacommand.QnaUpdateFormCommand;

public class CommandFactory {
   private static CommandFactory factory = new CommandFactory();
   
   private HashMap<String, Command> commandList
                        = new HashMap<String, Command>();
   
   private CommandFactory() {
      
      
      // login
      commandList.put("/KKANGAZI/memberloginForm.do", new MemberLoginFormCommand());//
      commandList.put("/KKANGAZI/memberlogin.do", new MemberLoginCommand());
      commandList.put("/KKANGAZI/memberInsertForm.do", new MemberInsertFormCommand());//
      commandList.put("/KKANGAZI/memberInsert.do", new MemberInsertCommand());
      commandList.put("/KKANGAZI/memberlogout.do", new MemberLogoutCommand());
      
      //ID,PW 
      commandList.put("/KKANGAZI/memberIdfindForm.do", new MemberIdfindFormCommand());//
       commandList.put("/KKANGAZI/memberIdfind.do", new MemberIdfindCommand());
       commandList.put("/KKANGAZI/memberPsfindForm.do", new MemberPsfindFormCommand());//
       commandList.put("/KKANGAZI/memberPsfind.do", new MemberPsfindCommand());
      
      // 
      commandList.put("/KKANGAZI/memberUpdateForm.do", new MemberUpdateFormCommand());// 
      commandList.put("/KKANGAZI/memberUpdate.do", new MemberUpdateCommand());
      commandList.put("/KKANGAZI/memberDelete.do", new MemberDeleteCommand());
      commandList.put("/KKANGAZI/memberQnaForm.do", new MemberQnaFormCommand());
      
      // ID
      commandList.put("/KKANGAZI/memberIdCheck.do", new MemberIdCheckCommand());

      // board
      commandList.put("/KKANGAZI/boardList.do", new BoardListCommand());
      commandList.put("/KKANGAZI/boardInsertForm.do", new BoardInsertFormCommand());
      commandList.put("/KKANGAZI/boardInsert.do", new BoardInsertCommand());
      commandList.put("/KKANGAZI/boardDelete.do", new BoardDeleteCommand());
      commandList.put("/KKANGAZI/hitUpdate.do", new HitUpdateCommand());
      commandList.put("/KKANGAZI/boardDetail.do", new BoardDetailCommand());
      commandList.put("/KKANGAZI/commentInsert.do", new CommentInsertCommand());
      commandList.put("/KKANGAZI/commentDelete.do", new CommentDeleteCommand());
      commandList.put("/KKANGAZI/commentReply.do", new CommentReplyCommand());
      commandList.put("/KKANGAZI/compleUpdate.do", new CompleUpdateCommand());
      commandList.put("/KKANGAZI/myboardList.do", new MemberBoardListCommand()); 
      commandList.put("/KKANGAZI/boardUpdateForm.do", new BoardUpdateFormCommand()); 
      commandList.put("/KKANGAZI/boardUpdate.do", new BoardUpdateCommand()); 
      
      // QNA
      commandList.put("/KKANGAZI/qnaInsertForm.do", new QnaInsertFormCommand());
      commandList.put("/KKANGAZI/qnaInsert.do", new QnaInsertCommand());
      commandList.put("/KKANGAZI/qnaList.do", new QnaListCommand());
      commandList.put("/KKANGAZI/qnaDetail.do" , new QnaDetailCommand());
      commandList.put("/KKANGAZI/qnaDelete.do" , new QnaDeleteCommand());
      commandList.put("/KKANGAZI/qnaUpdateFrom.do" , new QnaUpdateFormCommand());
      commandList.put("/KKANGAZI/qnaUpdate.do" , new QnaUpdateCommand());
      commandList.put("/KKANGAZI/qnaReplyForm.do" , new QnaReplayFormCommand());
      commandList.put("/KKANGAZI/qnaReply.do", new QnaReplayCommand());
      commandList.put("/KKANGAZI/qnaSec.do", new QnaSecCommand());
      commandList.put("/KKANGAZI/faqInsertForm.do", new FaqInsertFormCommand());
      commandList.put("/KKANGAZI/faqInsert.do", new FaqInsertCommand());
      commandList.put("/KKANGAZI/faqDetail.do", new FaqDetailCommand());
      commandList.put("/KKANGAZI/faqDelete.do", new FaqDeleteCommand());
      commandList.put("/KKANGAZI/faqUpdateForm.do", new FaqUpdateFormCommand());
      commandList.put("/KKANGAZI/faqUpdate.do", new FaqUpdateCommand());
      commandList.put("/KKANGAZI/faqList.do", new FaqListCommand());
      
   }
   
   public static CommandFactory getInstance() {
      return factory;
   }
   
   public Command getCommand(String uri) {
      Command command = commandList.get(uri);
      return command;
   }
}