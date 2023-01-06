# Autohotkey-Lock-UUID
[English version:](https://translate.google.com.br/?hl=en-US&sl=pt&tl=en&op=translate)


Portuguese version:

Aqui tento passar o meu conhecimento de como fazer para "encriptar" e rodar scripts feitos em AHK (AutoHotkey) somente em computadores com o UUID setado e também com um certo nível de criptografia passo a passo.   
>Lembrando: Isso vai apenas bloquear usuários casuais de AHK de acessarem seu código. É considerado encriptação pois existe uma key envolvida (duas caso você utilizar o compilador do Autohotkey_H com senha) para a criptografia. Pessoas com um pouco mais de conhecimento em desencriptação irão conseguir desencriptar o arquivo facilmente. Todos os arquivos tem source. Irei creditar os autores e disponibilizar as sources no final desse readme. Também irei disponibilizar links úteis sobre o assunto.

Passos:  

1° - Baixe o sourcecode que disponibilizo aqui (novamente, créditos para os criadores no final do readme)  
2° - Execute o arquivo "Get_UUID.ahk" para saber qual é o UUID de seu computador  
3° - Coloque o código do arquivo "Arquivo_Não_Encriptado_Com_Chave_UUID.ahk" no começo do arquivo escolhido e mude o UUID_User para o seu UUID que você acabou de pegar no passo 2   
4° - Teste o arquivo para ver se está funcionando antes de "encriptá-lo"  
5° - Abra o arquivo Encriptador.AHK e jogue o arquivo que você acabou de testar nele  
6° - Depois disso, caso você abrir o arquivo, verá que ele estará "encriptado"  
7° - Use o compilador (Ahk2Exe) do Autohotkey_H (caso queira encriptar o .exe) ou o do Autohotkey_L com compressão para não mostrar o código no final do .exe  
8° - Ta-dam! Você conseguiu compilar o arquivo e "encriptá-lo" com sucesso!  

Observações:   

O ahk2exe do AHK_H, em alguns arquivos, compila certo mas faz o código dar erro. Ainda não achei solução pra isso.  
UPX > MPress, UPX causa menos problemas com antivirus do que o MPress (caso você ainda usar antivirus, quem usa isso em 2022?)  
Com esse método, o código será escondido do ResourceHacker mas terá falsos positivos.  
Caso use para scripts em jogos, talvez, TALVEZ, você irá conseguir reutilizar o código caso ele for pego por anti-cheats como por exemplo o BattleEye

Créditos/Links úteis:

- [Get_UUID e Arquivo rodar apenas com o UUID setado](https://www.autohotkey.com/boards/viewtopic.php?t=71638)
- [Encriptador](https://www.autohotkey.com/boards/viewtopic.php?f=28&t=42494&start=20)
- [Discussão com mais informações sobre o assunto](https://www.autohotkey.com/boards/viewtopic.php?t=72986)
- [Caso o Ahk2Exe do AutoHotkey_H bugar, tenta achar alguma esperança aqui](https://www.autohotkey.com/boards/viewtopic.php?t=100689)
- [E aqui também](https://www.autohotkey.com/boards/viewtopic.php?t=29126)
- [Mais uma discussão com mais informações sobre o assunto](https://www.autohotkey.com/boards/viewtopic.php?t=84958)
