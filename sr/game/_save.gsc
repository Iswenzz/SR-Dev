#include sr\sys\_events;

main()
{
	level.saves = [];

	menu("-1", "save", ::menu_Save);

	addSave("Trigger", sr\game\_trigger::save);
}

addSave(title, callback)
{
	save = spawnStruct();
	save.title = title;
	save.callback = callback;

	level.saves[level.saves.size] = save;
}

menu_Save(arg)
{
	logPrint("\n\n<=========== SR-Dev ===========>\n\n");
	for (i = 0; i < level.saves.size; i++)
	{
		save = level.saves[i];
		logPrint("\n\n" + save.title + "\n\n");
		self thread [[save.callback]]();
	}
}
