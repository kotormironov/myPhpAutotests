<?php

namespace Helper;

use Codeception\Exception\ModuleException;
use Codeception\Module;
use Exception;

class Acceptance extends Module
{

    /**
     * @param $cssOrXPathOrRegex
     *
     * @return bool
     *
     * @throws ModuleException
     *
     * @deprecated
     */
    public function seeRegexText($cssOrXPathOrRegex)
    {
        $text = $this->getModule('WebDriver')->grabTextFrom($cssOrXPathOrRegex);
        if (!preg_match('/[А-я]/', $text)) {
            throw new Exception('Letter not found');
        }

        return true;
    }

    /**
     * Действие Клик с последующй проверкой на сообщения об ошибках
     *
     * @param $selector
     *
     * @throws ModuleException
     * @deprecated
     */
    public function clickAndCheck($selector)
    {
        $this->getModule('WebDriver')->click($selector);
        // if ($_ENV ===
        // if ((IS_DEV || IS_TEST || IS_AUTOTESTING || IS_HOTFIX) && !IS_AJAX))

        $clickAndCheckArray = [
            'Warning',
            'warning',
            'Error',
            'error',
            'Notice',
            'notice',
            'Uncaught',
            'uncaught',
            'Exception',
            'exception',
            'Fatal',
            'fatal',
            'Strict',
            'strict',
        ];
        foreach ($clickAndCheckArray as $value) {
            $this->getModule('WebDriver')->dontSee($value);
        }
    }

    /**
     * Задержка
     *
     * @param string $table
     * @param array $criteria
     * @param int $timeOut
     *
     * @throws ModuleException
     */
    public function delay($table, $criteria, $timeOut = 1)
    {
        for ($i = 1; $i < $timeOut; $i++) {
            if ($this->getModule('Db')->grabNumRecords($table, $criteria)) {
                break;
            }
            $this->getModule('WebDriver')->wait(1);
        }
    }

    /**
     * Ждем и проверяем запись в базе данных
     *
     * @param string $table
     * @param array $criteria
     * @param int $timeOut
     *
     * @throws ModuleException
     */
    public function waitAndSeeInDatabase($table, $criteria, $timeOut = 1)
    {
        $this->delay($table, $criteria, $timeOut);
        $this->getModule('Db')->seeInDatabase($table, $criteria);
    }

    /**
     * Ждем и проверяем отсутствие записи в базе данных
     *
     * @param string $table
     * @param array $criteria
     * @param int $timeOut
     *
     * @throws ModuleException
     */
    public function waitAndDontSeeInDatabase($table, $criteria, $timeOut = 1)
    {
        $this->delay($table, $criteria, $timeOut);
        $this->getModule('Db')->dontSeeInDatabase($table, $criteria);
    }

    public function clearTables(array $tables = []): void
    {
        $dbh = $this->getModule('Db')->_getDbh();

        foreach ($tables as $table) {
            $query = 'TRUNCATE ' . $table . ' RESTART IDENTITY;';
            $sth = $dbh->prepare($query);
            $sth->execute();
        }
    }

    public function deleteFromDatabase($table, $criteria)
    {
        $dbh = $this->getModule('Db')->_getDbh();
        $query = "DELETE FROM %s WHERE %s";
        $params = [];
        foreach ($criteria as $x => $y) {
            $params[] = "$x = '$y'";
        }
        $params = implode(' AND ', $params);
        $query = sprintf($query, $table, $params);
        codecept_debug($query);
        $this->debugSection('Query', $query);
        $sth = $dbh->prepare($query);

        return $sth->execute();
    }

}
