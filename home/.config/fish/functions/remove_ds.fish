function remove_ds
    find ./ -name '.DS_Store' -depth -exec rm '{}' + -print
end

