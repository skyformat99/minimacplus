TARGET:=tme
MUSASHI_GEN_SRC:=musashi/m68kops.c musashi/m68kopac.c musashi/m68kopdm.c musashi/m68kopnz.c
OBJ:=$(MUSASHI_GEN_SRC:%.x=%.o) musashi/m68kcpu.o  main.o emu.o disp.o
#musashi/m68kdasm.o
CFLAGS=-Wall -I. -I./musashi -ggdb
LDFLAGS=

$(TARGET): $(OBJ)
	$(CC) -o $(@) $(CFLAGS) $(LDFLAGS) $^

$(MUSASHI_GEN_SRC): musashi/m68kmake
	cd musashi; ../$(^)

musashi/m68kmake: musashi/m68kmake.c
	$(CC) -o $@ $^

clean:
	rm -f $(MUSASHI_GEN_SRC) musashi/m68kmake
	rm -f $(OBJ) $(TARGET)
