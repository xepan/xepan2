<?php
	class page index extends Page
	{
		public $title='Dashboard';

			function init()
			{
			parent::init();
			$this->add('View Box')
				->setHTML('hello Nilam'.'<b>admin/page/test.php'</b>.'file in your text editor'.'<a href="http//book/agiletoolkit.org" target=_blank>reading'.'the documnetation</a>.');

			}
	}