function phpunit
    if test -e ./vendor/bin/phpunit; and test -x ./vendor/bin/phpunit
        ./vendor/bin/phpunit $argv
    else
        phpunit $argv
    end
end

