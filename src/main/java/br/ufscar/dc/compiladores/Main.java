package br.ufscar.dc.compiladores;

import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.Token;

import java.io.IOException;
import java.io.PrintWriter;

public class Main {
    public static void main(String[] args) {
        try {
        CharStream cs = CharStreams.fromFileName(args[0]);
        JanderLexico lex = new JanderLexico(cs);
        String arquivoSaida = args[1];
        PrintWriter pw = new PrintWriter(arquivoSaida);

        Token t = null;

        while((t = lex.nextToken()).getType() != Token.EOF) {
            String nomeToken = JanderLexico.VOCABULARY.getDisplayName(t.getType());

            // Caso seja um erro
            if(nomeToken.equals("ERRO")) {
                    //System.out.println("Erro na linha "+t.getLine()+": "+t.getText());
                    pw.println("Erro na linha "+t.getLine()+": "+t.getText());
                    break;
            } 
            // Caso seja uma cadeia não fechada
            else if(nomeToken.equals("CADEIA_NAO_FECHADA")) {
                    //System.out.println("Cadeia não fechada na linha "+t.getLine());
                    pw.println("Cadeia não fechada na linha "+t.getLine());
                    break;
            } 
            // Caso seja um comentário não fechado
            else if(nomeToken.equals("COMENTARIO_NAO_FECHADO")) {
                    //System.out.println("Cadeia não fechada na linha "+t.getLine());
                    pw.println("Comentário não fechado na linha "+t.getLine());
                    break;
            }
            // Caso seja algum operador (Aritmético, Relacional ou Lógico)
            else if(nomeToken.equals("OP_REL" ) || nomeToken.equals("OP_ARIT" ) || nomeToken.equals("OP_LOGICO")){
                // System.out.println("<" + '\'' + t.getText() + '\'' + ',' + '\'' + t.getText() + '\'' + ">");
                pw.println("<" + '\'' + t.getText() + '\'' + ',' + '\'' + t.getText() + '\'' + ">");
            }
            // Mensagem sem erro
            else {
                    //System.out.println("<" + nomeToken + "," + t.getText() + ">");
                    pw.println("<" + nomeToken + "," + t.getText() + ">");
                }
        }

        pw.close();
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}