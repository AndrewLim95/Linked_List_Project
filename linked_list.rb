class LinkedList

    attr_accessor :head

    def initialize
        @head = nil
    end
    
    def append(value)
        if @head.nil?
            @head = Node.new(value,nil)
        else
            lastNode = @head
            while(!lastNode.nextNode.nil?)
                lastNode = lastNode.nextNode 
            end
            #end of list
            lastNode.nextNode = Node.new(value,nil)
        end
    end
    
    def prepend(value)
        @head = Node.new(value,@head)
    end

    def size
        nodes = 1
        lastNode = @head
        while(!lastNode.nextNode.nil?)
            lastNode = lastNode.nextNode 
            nodes+=1
        end
        return nodes
    end

    def head
        if !@head.nil?
            return @head.value
        end
    end

    def tail
        if !@head.nil?
            lastNode = @head
            while(!lastNode.nextNode.nil?)
                lastNode = lastNode.nextNode 
            end
            #end of list
            return lastNode.value
        end
    end

    def at(index)
        if !@head.nil?
            lastNode = @head
            match = 0
            while(!lastNode.nextNode.nil?)
                lastNode = lastNode.nextNode
                match += 1
                if match == index
                    break
                end 
            end
            #end of list
            return lastNode.value
        end
    end

    def pop
        if !@head.nil?
            lastNode = @head
            while(!lastNode.nextNode.nil?)
                previousNode = lastNode
                lastNode = lastNode.nextNode
            end
            lastNode = previousNode
            lastNode.nextNode = nil
        end
    end

    def contains?(value)
        if !@head.nil?
            lastNode = @head
            contain = false
            while(!lastNode.nextNode.nil?)
                lastNode = lastNode.nextNode
                if lastNode.value == value
                    contain = true
                end 
            end
            #end of list
            return contain
        end
    end

    def find(value)
        if !@head.nil?
            lastNode = @head
            index = 0
            while(!lastNode.nextNode.nil?)
                if lastNode.value == value
                    return index
                else
                    lastNode = lastNode.nextNode
                    index += 1
                end
                return nil
            end
            #end of list
        end
    end
    
    def to_s
        if !@head.nil?
            lastNode = @head
            index = 0
            print "(#{@head.value}) -> "
            while(!lastNode.nextNode.nil?)
                lastNode = lastNode.nextNode
                print "(#{lastNode.value}) -> "
            end
            #end of list
            print "nil"
        end
    end

    private
    class Node
        attr_accessor :value, :nextNode

        def initialize(value, nextNode)
            @value = value
            @nextNode = nextNode
        end
    end
end

ll = LinkedList.new
ll.append(10)
ll.append(20)
ll.prepend(5)

puts ll.head
puts ll.tail
puts ll.at(1)
puts ll.size

puts ll.pop
puts ll.tail
puts ll.size

puts ll.contains?(10)
puts ll.contains?(20)

puts ll.find(5)
puts ll.to_s


